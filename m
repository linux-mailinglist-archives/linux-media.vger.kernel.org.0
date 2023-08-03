Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F9776E21A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 09:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjHCHx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 03:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbjHCHxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 03:53:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144F386BB
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 00:43:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9154861C2E
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B94C433C7
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:42:11 +0000 (UTC)
Message-ID: <6b3fd58d-972a-a45c-c92f-d20f5b3b0a99@xs4all.nl>
Date:   Thu, 3 Aug 2023 09:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cx25840: simplify cx23885_dif_setup()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of creating a huge switch statement (that thoroughly confuses
smatch), create a table of coefficients and use that.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 3694 +++++-----------------
 1 file changed, 811 insertions(+), 2883 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 5aec25289062..04461c893d90 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -2738,10 +2738,801 @@ static int cx25840_irq_handler(struct v4l2_subdev *sd, u32 status,
 #define DIF_BPF_COEFF3435	(0x38c)
 #define DIF_BPF_COEFF36		(0x390)

+static const u32 ifhz_coeffs[][19] = {
+	{	// 3.0 MHz
+		0x00000002, 0x00080012, 0x001e0024, 0x001bfff8,
+		0xffb4ff50, 0xfed8fe68, 0xfe24fe34, 0xfebaffc7,
+		0x014d031f, 0x04f0065d, 0x07010688, 0x04c901d6,
+		0xfe00f9d3, 0xf600f342, 0xf235f337, 0xf64efb22,
+		0x0105070f, 0x0c460fce, 0x110d0000,
+	}, {	// 3.1 MHz
+		0x00000001, 0x00070012, 0x00220032, 0x00370026,
+		0xfff0ff91, 0xff0efe7c, 0xfe01fdcc, 0xfe0afedb,
+		0x00440224, 0x0434060c, 0x0738074e, 0x06090361,
+		0xff99fb39, 0xf6fef3b6, 0xf21af2a5, 0xf573fa33,
+		0x0034067d, 0x0bfb0fb9, 0x110d0000,
+	}, {	// 3.2 MHz
+		0x00000000, 0x0004000e, 0x00200038, 0x004c004f,
+		0x002fffdf, 0xff5cfeb6, 0xfe0dfd92, 0xfd7ffe03,
+		0xff36010a, 0x03410575, 0x072607d2, 0x071804d5,
+		0x0134fcb7, 0xf81ff451, 0xf223f22e, 0xf4a7f94b,
+		0xff6405e8, 0x0bae0fa4, 0x110d0000,
+	}, {	// 3.3 MHz
+		0x0000ffff, 0x00000008, 0x001a0036, 0x0056006d,
+		0x00670030, 0xffbdff10, 0xfe46fd8d, 0xfd25fd4f,
+		0xfe35ffe0, 0x0224049f, 0x06c9080e, 0x07ef0627,
+		0x02c9fe45, 0xf961f513, 0xf250f1d2, 0xf3ecf869,
+		0xfe930552, 0x0b5f0f8f, 0x110d0000,
+	}, {	// 3.4 MHz
+		0xfffffffe, 0xfffd0001, 0x000f002c, 0x0054007d,
+		0x0093007c, 0x0024ff82, 0xfea6fdbb, 0xfd03fcca,
+		0xfd51feb9, 0x00eb0392, 0x06270802, 0x08880750,
+		0x044dffdb, 0xfabdf5f8, 0xf2a0f193, 0xf342f78f,
+		0xfdc404b9, 0x0b0e0f78, 0x110d0000,
+	}, {	// 3.5 MHz
+		0xfffffffd, 0xfffafff9, 0x0002001b, 0x0046007d,
+		0x00ad00ba, 0x00870000, 0xff26fe1a, 0xfd1bfc7e,
+		0xfc99fda4, 0xffa5025c, 0x054507ad, 0x08dd0847,
+		0x05b80172, 0xfc2ef6ff, 0xf313f170, 0xf2abf6bd,
+		0xfcf6041f, 0x0abc0f61, 0x110d0000,
+	}, {	// 3.6 MHz
+		0xfffffffd, 0xfff8fff3, 0xfff50006, 0x002f006c,
+		0x00b200e3, 0x00dc007e, 0xffb9fea0, 0xfd6bfc71,
+		0xfc17fcb1, 0xfe65010b, 0x042d0713, 0x08ec0906,
+		0x07020302, 0xfdaff823, 0xf3a7f16a, 0xf228f5f5,
+		0xfc2a0384, 0x0a670f4a, 0x110d0000,
+	}, {	// 3.7 MHz
+		0x0000fffd, 0xfff7ffef, 0xffe9fff1, 0x0010004d,
+		0x00a100f2, 0x011a00f0, 0x0053ff44, 0xfdedfca2,
+		0xfbd3fbef, 0xfd39ffae, 0x02ea0638, 0x08b50987,
+		0x08230483, 0xff39f960, 0xf45bf180, 0xf1b8f537,
+		0xfb6102e7, 0x0a110f32, 0x110d0000,
+	}, {	// 3.8 MHz
+		0x0000fffe, 0xfff9ffee, 0xffe1ffdd, 0xfff00024,
+		0x007c00e5, 0x013a014a, 0x00e6fff8, 0xfe98fd0f,
+		0xfbd3fb67, 0xfc32fe54, 0x01880525, 0x083909c7,
+		0x091505ee, 0x00c7fab3, 0xf52df1b4, 0xf15df484,
+		0xfa9b0249, 0x09ba0f19, 0x110d0000,
+	}, {	// 3.9 MHz
+		0x00000000, 0xfffbfff0, 0xffdeffcf, 0xffd1fff6,
+		0x004800be, 0x01390184, 0x016300ac, 0xff5efdb1,
+		0xfc17fb23, 0xfb5cfd0d, 0x001703e4, 0x077b09c4,
+		0x09d2073c, 0x0251fc18, 0xf61cf203, 0xf118f3dc,
+		0xf9d801aa, 0x09600eff, 0x110d0000,
+	}, {	// 4.0 MHz
+		0x00000001, 0xfffefff4, 0xffe1ffc8, 0xffbaffca,
+		0x000b0082, 0x01170198, 0x01c10152, 0x0030fe7b,
+		0xfc99fb24, 0xfac3fbe9, 0xfea5027f, 0x0683097f,
+		0x0a560867, 0x03d2fd89, 0xf723f26f, 0xf0e8f341,
+		0xf919010a, 0x09060ee5, 0x110d0000,
+	}, {	// 4.1 MHz
+		0x00010002, 0x0002fffb, 0xffe8ffca, 0xffacffa4,
+		0xffcd0036, 0x00d70184, 0x01f601dc, 0x00ffff60,
+		0xfd51fb6d, 0xfa6efaf5, 0xfd410103, 0x055708f9,
+		0x0a9e0969, 0x0543ff02, 0xf842f2f5, 0xf0cef2b2,
+		0xf85e006b, 0x08aa0ecb, 0x110d0000,
+	}, {	// 4.2 MHz
+		0x00010003, 0x00050003, 0xfff3ffd3, 0xffaaff8b,
+		0xff95ffe5, 0x0080014a, 0x01fe023f, 0x01ba0050,
+		0xfe35fbf8, 0xfa62fa3b, 0xfbf9ff7e, 0x04010836,
+		0x0aa90a3d, 0x069f007f, 0xf975f395, 0xf0cbf231,
+		0xf7a9ffcb, 0x084c0eaf, 0x110d0000,
+	}, {	// 4.3 MHz
+		0x00010003, 0x0008000a, 0x0000ffe4, 0xffb4ff81,
+		0xff6aff96, 0x001c00f0, 0x01d70271, 0x0254013b,
+		0xff36fcbd, 0xfa9ff9c5, 0xfadbfdfe, 0x028c073b,
+		0x0a750adf, 0x07e101fa, 0xfab8f44e, 0xf0ddf1be,
+		0xf6f9ff2b, 0x07ed0e94, 0x110d0000,
+	}, {	// 4.4 MHz
+		0x00000003, 0x0009000f, 0x000efff8, 0xffc9ff87,
+		0xff52ff54, 0xffb5007e, 0x01860270, 0x02c00210,
+		0x0044fdb2, 0xfb22f997, 0xf9f2fc90, 0x0102060f,
+		0x0a050b4c, 0x0902036e, 0xfc0af51e, 0xf106f15a,
+		0xf64efe8b, 0x078d0e77, 0x110d0000,
+	}, {	// 4.5 MHz
+		0x00000002, 0x00080012, 0x0019000e, 0xffe5ff9e,
+		0xff4fff25, 0xff560000, 0x0112023b, 0x02f702c0,
+		0x014dfec8, 0xfbe5f9b3, 0xf947fb41, 0xff7004b9,
+		0x095a0b81, 0x0a0004d8, 0xfd65f603, 0xf144f104,
+		0xf5aafdec, 0x072b0e5a, 0x110d0000,
+	}, {	// 4.6 MHz
+		0x00000001, 0x00060012, 0x00200022, 0x0005ffc1,
+		0xff61ff10, 0xff09ff82, 0x008601d7, 0x02f50340,
+		0x0241fff0, 0xfcddfa19, 0xf8e2fa1e, 0xfde30343,
+		0x08790b7f, 0x0ad50631, 0xfec7f6fc, 0xf198f0bd,
+		0xf50dfd4e, 0x06c90e3d, 0x110d0000,
+	}, {	// 4.7 MHz
+		0x0000ffff, 0x0003000f, 0x00220030, 0x0025ffed,
+		0xff87ff15, 0xfed6ff10, 0xffed014c, 0x02b90386,
+		0x03110119, 0xfdfefac4, 0xf8c6f92f, 0xfc6701b7,
+		0x07670b44, 0x0b7e0776, 0x002df807, 0xf200f086,
+		0xf477fcb1, 0x06650e1e, 0x110d0000,
+	}, {	// 4.8 MHz
+		0xfffffffe, 0xffff0009, 0x001e0038, 0x003f001b,
+		0xffbcff36, 0xfec2feb6, 0xff5600a5, 0x0248038d,
+		0x03b00232, 0xff39fbab, 0xf8f4f87f, 0xfb060020,
+		0x062a0ad2, 0x0bf908a3, 0x0192f922, 0xf27df05e,
+		0xf3e8fc14, 0x06000e00, 0x110d0000,
+	}, {	// 4.9 MHz
+		0xfffffffd, 0xfffc0002, 0x00160037, 0x00510046,
+		0xfff9ff6d, 0xfed0fe7c, 0xfecefff0, 0x01aa0356,
+		0x0413032b, 0x007ffcc5, 0xf96cf812, 0xf9cefe87,
+		0x04c90a2c, 0x0c4309b4, 0x02f3fa4a, 0xf30ef046,
+		0xf361fb7a, 0x059b0de0, 0x110d0000,
+	}, {	// 5.0 MHz
+		0xfffffffd, 0xfff9fffa, 0x000a002d, 0x00570067,
+		0x0037ffb5, 0xfefffe68, 0xfe62ff3d, 0x00ec02e3,
+		0x043503f6, 0x01befe05, 0xfa27f7ee, 0xf8c6fcf8,
+		0x034c0954, 0x0c5c0aa4, 0x044cfb7e, 0xf3b1f03f,
+		0xf2e2fae1, 0x05340dc0, 0x110d0000,
+	}, {	// 5.1 MHz
+		0x0000fffd, 0xfff8fff4, 0xfffd001e, 0x0051007b,
+		0x006e0006, 0xff48fe7c, 0xfe1bfe9a, 0x001d023e,
+		0x04130488, 0x02e6ff5b, 0xfb1ef812, 0xf7f7fb7f,
+		0x01bc084e, 0x0c430b72, 0x059afcba, 0xf467f046,
+		0xf26cfa4a, 0x04cd0da0, 0x110d0000,
+	}, {	// 5.2 MHz
+		0x0000fffe, 0xfff8ffef, 0xfff00009, 0x003f007f,
+		0x00980056, 0xffa5feb6, 0xfe00fe15, 0xff4b0170,
+		0x03b004d7, 0x03e800b9, 0xfc48f87f, 0xf768fa23,
+		0x0022071f, 0x0bf90c1b, 0x06dafdfd, 0xf52df05e,
+		0xf1fef9b5, 0x04640d7f, 0x110d0000,
+	}, {	// 5.3 MHz
+		0x0000ffff, 0xfff9ffee, 0xffe6fff3, 0x00250072,
+		0x00af009c, 0x000cff10, 0xfe13fdb8, 0xfe870089,
+		0x031104e1, 0x04b8020f, 0xfd98f92f, 0xf71df8f0,
+		0xfe8805ce, 0x0b7e0c9c, 0x0808ff44, 0xf603f086,
+		0xf19af922, 0x03fb0d5e, 0x110d0000,
+	}, {	// 5.4 MHz
+		0x00000001, 0xfffcffef, 0xffe0ffe0, 0x00050056,
+		0x00b000d1, 0x0071ff82, 0xfe53fd8c, 0xfddfff99,
+		0x024104a3, 0x054a034d, 0xff01fa1e, 0xf717f7ed,
+		0xfcf50461, 0x0ad50cf4, 0x0921008d, 0xf6e7f0bd,
+		0xf13ff891, 0x03920d3b, 0x110d0000,
+	}, {	// 5.5 MHz
+		0x00010002, 0xfffffff3, 0xffdeffd1, 0xffe5002f,
+		0x009c00ed, 0x00cb0000, 0xfebafd94, 0xfd61feb0,
+		0x014d0422, 0x05970464, 0x0074fb41, 0xf759f721,
+		0xfb7502de, 0x0a000d21, 0x0a2201d4, 0xf7d9f104,
+		0xf0edf804, 0x03280d19, 0x110d0000,
+	}, {	// 5.6 MHz
+		0x00010003, 0x0003fffa, 0xffe3ffc9, 0xffc90002,
+		0x007500ef, 0x010e007e, 0xff3dfdcf, 0xfd16fddd,
+		0x00440365, 0x059b0548, 0x01e3fc90, 0xf7dff691,
+		0xfa0f014d, 0x09020d23, 0x0b0a0318, 0xf8d7f15a,
+		0xf0a5f779, 0x02bd0cf6, 0x110d0000,
+	}, {	// 5.7 MHz
+		0x00010003, 0x00060001, 0xffecffc9, 0xffb4ffd4,
+		0x004000d5, 0x013600f0, 0xffd3fe39, 0xfd04fd31,
+		0xff360277, 0x055605ef, 0x033efdfe, 0xf8a5f642,
+		0xf8cbffb6, 0x07e10cfb, 0x0bd50456, 0xf9dff1be,
+		0xf067f6f2, 0x02520cd2, 0x110d0000,
+	}, {	// 5.8 MHz
+		0x00000003, 0x00080009, 0xfff8ffd2, 0xffaaffac,
+		0x000200a3, 0x013c014a, 0x006dfec9, 0xfd2bfcb7,
+		0xfe350165, 0x04cb0651, 0x0477ff7e, 0xf9a5f635,
+		0xf7b1fe20, 0x069f0ca8, 0x0c81058b, 0xfaf0f231,
+		0xf033f66d, 0x01e60cae, 0x110d0000,
+	}, {	// 5.9 MHz
+		0x00000002, 0x0009000e, 0x0005ffe1, 0xffacff90,
+		0xffc5005f, 0x01210184, 0x00fcff72, 0xfd8afc77,
+		0xfd51003f, 0x04020669, 0x05830103, 0xfad7f66b,
+		0xf6c8fc93, 0x05430c2b, 0x0d0d06b5, 0xfc08f2b2,
+		0xf00af5ec, 0x017b0c89, 0x110d0000,
+	}, {	// 6.0 MHz
+		0x00000001, 0x00070012, 0x0012fff5, 0xffbaff82,
+		0xff8e000f, 0x00e80198, 0x01750028, 0xfe18fc75,
+		0xfc99ff15, 0x03050636, 0x0656027f, 0xfc32f6e2,
+		0xf614fb17, 0x03d20b87, 0x0d7707d2, 0xfd26f341,
+		0xefeaf56f, 0x010f0c64, 0x110d0000,
+	}, {	// 6.1 MHz
+		0xffff0000, 0x00050012, 0x001c000b, 0xffd1ff84,
+		0xff66ffbe, 0x00960184, 0x01cd00da, 0xfeccfcb2,
+		0xfc17fdf9, 0x01e005bc, 0x06e703e4, 0xfdabf798,
+		0xf599f9b3, 0x02510abd, 0x0dbf08df, 0xfe48f3dc,
+		0xefd5f4f6, 0x00a20c3e, 0x110d0000,
+	}, {	// 6.2 MHz
+		0xfffffffe, 0x0002000f, 0x0021001f, 0xfff0ff97,
+		0xff50ff74, 0x0034014a, 0x01fa0179, 0xff97fd2a,
+		0xfbd3fcfa, 0x00a304fe, 0x07310525, 0xff37f886,
+		0xf55cf86e, 0x00c709d0, 0x0de209db, 0xff6df484,
+		0xefcbf481, 0x00360c18, 0x110d0000,
+	}, {	// 6.3 MHz
+		0xfffffffd, 0xfffe000a, 0x0021002f, 0x0010ffb8,
+		0xff50ff3b, 0xffcc00f0, 0x01fa01fa, 0x0069fdd4,
+		0xfbd3fc26, 0xff5d0407, 0x07310638, 0x00c9f9a8,
+		0xf55cf74e, 0xff3908c3, 0x0de20ac3, 0x0093f537,
+		0xefcbf410, 0xffca0bf2, 0x110d0000,
+	}, {	// 6.4 MHz
+		0xfffffffd, 0xfffb0003, 0x001c0037, 0x002fffe2,
+		0xff66ff17, 0xff6a007e, 0x01cd0251, 0x0134fea5,
+		0xfc17fb8b, 0xfe2002e0, 0x06e70713, 0x0255faf5,
+		0xf599f658, 0xfdaf0799, 0x0dbf0b96, 0x01b8f5f5,
+		0xefd5f3a3, 0xff5e0bca, 0x110d0000,
+	}, {	// 6.5 MHz
+		0x0000fffd, 0xfff9fffb, 0x00120037, 0x00460010,
+		0xff8eff0f, 0xff180000, 0x01750276, 0x01e8ff8d,
+		0xfc99fb31, 0xfcfb0198, 0x065607ad, 0x03cefc64,
+		0xf614f592, 0xfc2e0656, 0x0d770c52, 0x02daf6bd,
+		0xefeaf33b, 0xfef10ba3, 0x110d0000,
+	}, {	// 6.6 MHz
+		0x0000fffe, 0xfff7fff5, 0x0005002f, 0x0054003c,
+		0xffc5ff22, 0xfedfff82, 0x00fc0267, 0x0276007e,
+		0xfd51fb1c, 0xfbfe003e, 0x05830802, 0x0529fdec,
+		0xf6c8f4fe, 0xfabd04ff, 0x0d0d0cf6, 0x03f8f78f,
+		0xf00af2d7, 0xfe850b7b, 0x110d0000,
+	}, {	// 6.7 MHz
+		0x0000ffff, 0xfff8fff0, 0xfff80020, 0x00560060,
+		0x0002ff4e, 0xfec4ff10, 0x006d0225, 0x02d50166,
+		0xfe35fb4e, 0xfb35fee1, 0x0477080e, 0x065bff82,
+		0xf7b1f4a0, 0xf9610397, 0x0c810d80, 0x0510f869,
+		0xf033f278, 0xfe1a0b52, 0x110d0000,
+	}, {	// 6.8 MHz
+		0x00010000, 0xfffaffee, 0xffec000c, 0x004c0078,
+		0x0040ff8e, 0xfecafeb6, 0xffd301b6, 0x02fc0235,
+		0xff36fbc5, 0xfaaafd90, 0x033e07d2, 0x075b011b,
+		0xf8cbf47a, 0xf81f0224, 0x0bd50def, 0x0621f94b,
+		0xf067f21e, 0xfdae0b29, 0x110d0000,
+	}, {	// 6.9 MHz
+		0x00010001, 0xfffdffef, 0xffe3fff6, 0x0037007f,
+		0x0075ffdc, 0xfef2fe7c, 0xff3d0122, 0x02ea02dd,
+		0x0044fc79, 0xfa65fc5d, 0x01e3074e, 0x082102ad,
+		0xfa0ff48c, 0xf6fe00a9, 0x0b0a0e43, 0x0729fa33,
+		0xf0a5f1c9, 0xfd430b00, 0x110d0000,
+	}, {	// 7.0 MHz
+		0x00010002, 0x0001fff3, 0xffdeffe2, 0x001b0076,
+		0x009c002d, 0xff35fe68, 0xfeba0076, 0x029f0352,
+		0x014dfd60, 0xfa69fb53, 0x00740688, 0x08a7042d,
+		0xfb75f4d6, 0xf600ff2d, 0x0a220e7a, 0x0827fb22,
+		0xf0edf17a, 0xfcd80ad6, 0x110d0000,
+	}, {	// 7.1 MHz
+		0x00000003, 0x0004fff9, 0xffe0ffd2, 0xfffb005e,
+		0x00b0007a, 0xff8ffe7c, 0xfe53ffc1, 0x0221038c,
+		0x0241fe6e, 0xfab6fa80, 0xff010587, 0x08e90590,
+		0xfcf5f556, 0xf52bfdb3, 0x09210e95, 0x0919fc15,
+		0xf13ff12f, 0xfc6e0aab, 0x110d0000,
+	}, {	// 7.2 MHz
+		0x00000003, 0x00070000, 0xffe6ffc9, 0xffdb0039,
+		0x00af00b8, 0xfff4feb6, 0xfe13ff10, 0x01790388,
+		0x0311ff92, 0xfb48f9ed, 0xfd980453, 0x08e306cd,
+		0xfe88f60a, 0xf482fc40, 0x08080e93, 0x09fdfd0c,
+		0xf19af0ea, 0xfc050a81, 0x110d0000,
+	}, {	// 7.3 MHz
+		0x00000002, 0x00080008, 0xfff0ffc9, 0xffc1000d,
+		0x009800e2, 0x005bff10, 0xfe00fe74, 0x00b50345,
+		0x03b000bc, 0xfc18f9a1, 0xfc4802f9, 0x089807dc,
+		0x0022f6f0, 0xf407fada, 0x06da0e74, 0x0ad3fe06,
+		0xf1fef0ab, 0xfb9c0a55, 0x110d0000,
+	}, {	// 7.4 MHz
+		0x00000001, 0x0008000e, 0xfffdffd0, 0xffafffdf,
+		0x006e00f2, 0x00b8ff82, 0xfe1bfdf8, 0xffe302c8,
+		0x041301dc, 0xfd1af99e, 0xfb1e0183, 0x080908b5,
+		0x01bcf801, 0xf3bdf985, 0x059a0e38, 0x0b99ff03,
+		0xf26cf071, 0xfb330a2a, 0x110d0000,
+	}, {	// 7.5 MHz
+		0xffff0000, 0x00070011, 0x000affdf, 0xffa9ffb5,
+		0x003700e6, 0x01010000, 0xfe62fda8, 0xff140219,
+		0x043502e1, 0xfe42f9e6, 0xfa270000, 0x073a0953,
+		0x034cf939, 0xf3a4f845, 0x044c0de1, 0x0c4f0000,
+		0xf2e2f03c, 0xfacc09fe, 0x110d0000,
+	}, {	// 7.6 MHz
+		0xffffffff, 0x00040012, 0x0016fff3, 0xffafff95,
+		0xfff900c0, 0x0130007e, 0xfecefd89, 0xfe560146,
+		0x041303bc, 0xff81fa76, 0xf96cfe7d, 0x063209b1,
+		0x04c9fa93, 0xf3bdf71e, 0x02f30d6e, 0x0cf200fd,
+		0xf361f00e, 0xfa6509d1, 0x110d0000,
+	}, {	// 7.7 MHz
+		0xfffffffe, 0x00010010, 0x001e0008, 0xffc1ff84,
+		0xffbc0084, 0x013e00f0, 0xff56fd9f, 0xfdb8005c,
+		0x03b00460, 0x00c7fb45, 0xf8f4fd07, 0x04fa09ce,
+		0x062afc07, 0xf407f614, 0x01920ce0, 0x0d8301fa,
+		0xf3e8efe5, 0xfa0009a4, 0x110d0000,
+	}, {	// 7.8 MHz
+		0x0000fffd, 0xfffd000b, 0x0022001d, 0xffdbff82,
+		0xff870039, 0x012a014a, 0xffedfde7, 0xfd47ff6b,
+		0x031104c6, 0x0202fc4c, 0xf8c6fbad, 0x039909a7,
+		0x0767fd8e, 0xf482f52b, 0x002d0c39, 0x0e0002f4,
+		0xf477efc2, 0xf99b0977, 0x110d0000,
+	}, {	// 7.9 MHz
+		0x0000fffd, 0xfffa0004, 0x0020002d, 0xfffbff91,
+		0xff61ffe8, 0x00f70184, 0x0086fe5c, 0xfd0bfe85,
+		0x024104e5, 0x0323fd7d, 0xf8e2fa79, 0x021d093f,
+		0x0879ff22, 0xf52bf465, 0xfec70b79, 0x0e6803eb,
+		0xf50defa5, 0xf937094a, 0x110d0000,
+	}, {	// 8.0 MHz
+		0x0000fffe, 0xfff8fffd, 0x00190036, 0x001bffaf,
+		0xff4fff99, 0x00aa0198, 0x0112fef3, 0xfd09fdb9,
+		0x014d04be, 0x041bfecc, 0xf947f978, 0x00900897,
+		0x095a00b9, 0xf600f3c5, 0xfd650aa3, 0x0ebc04de,
+		0xf5aaef8e, 0xf8d5091c, 0x110d0000,
+	}, {	// 8.1 MHz
+		0x0000ffff, 0xfff7fff6, 0x000e0038, 0x0037ffd7,
+		0xff52ff56, 0x004b0184, 0x0186ffa1, 0xfd40fd16,
+		0x00440452, 0x04de0029, 0xf9f2f8b2, 0xfefe07b5,
+		0x0a05024d, 0xf6fef34d, 0xfc0a09b8, 0x0efa05cd,
+		0xf64eef7d, 0xf87308ed, 0x110d0000,
+	}, {	// 8.2 MHz
+		0x00010000, 0xfff8fff0, 0x00000031, 0x004c0005,
+		0xff6aff27, 0xffe4014a, 0x01d70057, 0xfdacfca6,
+		0xff3603a7, 0x05610184, 0xfadbf82e, 0xfd74069f,
+		0x0a7503d6, 0xf81ff2ff, 0xfab808b9, 0x0f2306b5,
+		0xf6f9ef72, 0xf81308bf, 0x110d0000,
+	}, {	// 8.3 MHz
+		0x00010001, 0xfffbffee, 0xfff30022, 0x00560032,
+		0xff95ff10, 0xff8000f0, 0x01fe0106, 0xfe46fc71,
+		0xfe3502c7, 0x059e02ce, 0xfbf9f7f2, 0xfbff055b,
+		0x0aa9054c, 0xf961f2db, 0xf97507aa, 0x0f350797,
+		0xf7a9ef6d, 0xf7b40890, 0x110d0000,
+	}, {	// 8.4 MHz
+		0x00010002, 0xfffeffee, 0xffe8000f, 0x00540058,
+		0xffcdff14, 0xff29007e, 0x01f6019e, 0xff01fc7c,
+		0xfd5101bf, 0x059203f6, 0xfd41f7fe, 0xfaa903f3,
+		0x0a9e06a9, 0xfabdf2e2, 0xf842068b, 0x0f320871,
+		0xf85eef6e, 0xf7560860, 0x110d0000,
+	}, {	// 8.5 MHz
+		0x00000003, 0x0002fff2, 0xffe1fff9, 0x00460073,
+		0x000bff34, 0xfee90000, 0x01c10215, 0xffd0fcc5,
+		0xfc99009d, 0x053d04f1, 0xfea5f853, 0xf97d0270,
+		0x0a5607e4, 0xfc2ef314, 0xf723055f, 0x0f180943,
+		0xf919ef75, 0xf6fa0830, 0x110d0000,
+	}, {	// 8.6 MHz
+		0x00000003, 0x0005fff8, 0xffdeffe4, 0x002f007f,
+		0x0048ff6b, 0xfec7ff82, 0x0163025f, 0x00a2fd47,
+		0xfc17ff73, 0x04a405b2, 0x0017f8ed, 0xf88500dc,
+		0x09d208f9, 0xfdaff370, 0xf61c0429, 0x0ee80a0b,
+		0xf9d8ef82, 0xf6a00800, 0x110d0000,
+	}, {	// 8.7 MHz
+		0x00000003, 0x0007ffff, 0xffe1ffd4, 0x0010007a,
+		0x007cffb2, 0xfec6ff10, 0x00e60277, 0x0168fdf9,
+		0xfbd3fe50, 0x03ce0631, 0x0188f9c8, 0xf7c7ff43,
+		0x091509e3, 0xff39f3f6, 0xf52d02ea, 0x0ea30ac9,
+		0xfa9bef95, 0xf64607d0, 0x110d0000,
+	}, {	// 8.8 MHz
+		0x00000002, 0x00090007, 0xffe9ffca, 0xfff00065,
+		0x00a10003, 0xfee6feb6, 0x0053025b, 0x0213fed0,
+		0xfbd3fd46, 0x02c70668, 0x02eafadb, 0xf74bfdae,
+		0x08230a9c, 0x00c7f4a3, 0xf45b01a6, 0x0e480b7c,
+		0xfb61efae, 0xf5ef079f, 0x110d0000,
+	}, {	// 8.9 MHz
+		0xffff0000, 0x0008000d, 0xfff5ffc8, 0xffd10043,
+		0x00b20053, 0xff24fe7c, 0xffb9020c, 0x0295ffbb,
+		0xfc17fc64, 0x019b0654, 0x042dfc1c, 0xf714fc2a,
+		0x07020b21, 0x0251f575, 0xf3a7005e, 0x0dd80c24,
+		0xfc2aefcd, 0xf599076e, 0x110d0000,
+	}, {	// 9.0 MHz
+		0xffffffff, 0x00060011, 0x0002ffcf, 0xffba0018,
+		0x00ad009a, 0xff79fe68, 0xff260192, 0x02e500ab,
+		0xfc99fbb6, 0x005b05f7, 0x0545fd81, 0xf723fabf,
+		0x05b80b70, 0x03d2f669, 0xf313ff15, 0x0d550cbf,
+		0xfcf6eff2, 0xf544073d, 0x110d0000,
+	}, {	// 9.1 MHz
+		0xfffffffe, 0x00030012, 0x000fffdd, 0xffacffea,
+		0x009300cf, 0xffdcfe7c, 0xfea600f7, 0x02fd0190,
+		0xfd51fb46, 0xff150554, 0x0627fefd, 0xf778f978,
+		0x044d0b87, 0x0543f77d, 0xf2a0fdcf, 0x0cbe0d4e,
+		0xfdc4f01d, 0xf4f2070b, 0x110d0000,
+	}, {	// 9.2 MHz
+		0x0000fffd, 0x00000010, 0x001afff0, 0xffaaffbf,
+		0x006700ed, 0x0043feb6, 0xfe460047, 0x02db0258,
+		0xfe35fb1b, 0xfddc0473, 0x06c90082, 0xf811f85e,
+		0x02c90b66, 0x069ff8ad, 0xf250fc8d, 0x0c140dcf,
+		0xfe93f04d, 0xf4a106d9, 0x110d0000,
+	}, {	// 9.3 MHz
+		0x0000fffd, 0xfffc000c, 0x00200006, 0xffb4ff9c,
+		0x002f00ef, 0x00a4ff10, 0xfe0dff92, 0x028102f7,
+		0xff36fb37, 0xfcbf035e, 0x07260202, 0xf8e8f778,
+		0x01340b0d, 0x07e1f9f4, 0xf223fb51, 0x0b590e42,
+		0xff64f083, 0xf45206a7, 0x110d0000,
+	}, {	// 9.4 MHz
+		0x0000fffd, 0xfff90005, 0x0022001a, 0xffc9ff86,
+		0xfff000d7, 0x00f2ff82, 0xfe01fee5, 0x01f60362,
+		0x0044fb99, 0xfbcc0222, 0x07380370, 0xf9f7f6cc,
+		0xff990a7e, 0x0902fb50, 0xf21afa1f, 0x0a8d0ea6,
+		0x0034f0bf, 0xf4050675, 0x110d0000,
+	}, {	// 9.5 MHz
+		0x0000fffe, 0xfff8fffe, 0x001e002b, 0xffe5ff81,
+		0xffb400a5, 0x01280000, 0xfe24fe50, 0x01460390,
+		0x014dfc3a, 0xfb1000ce, 0x070104bf, 0xfb37f65f,
+		0xfe0009bc, 0x0a00fcbb, 0xf235f8f8, 0x09b20efc,
+		0x0105f101, 0xf3ba0642, 0x110d0000,
+	}, {	// 9.6 MHz
+		0x0001ffff, 0xfff8fff7, 0x00150036, 0x0005ff8c,
+		0xff810061, 0x013d007e, 0xfe71fddf, 0x007c0380,
+		0x0241fd13, 0xfa94ff70, 0x068005e2, 0xfc9bf633,
+		0xfc7308ca, 0x0ad5fe30, 0xf274f7e0, 0x08c90f43,
+		0x01d4f147, 0xf371060f, 0x110d0000,
+	}, {	// 9.7 MHz
+		0x00010001, 0xfff9fff1, 0x00090038, 0x0025ffa7,
+		0xff5e0012, 0x013200f0, 0xfee3fd9b, 0xffaa0331,
+		0x0311fe15, 0xfa60fe18, 0x05bd06d1, 0xfe1bf64a,
+		0xfafa07ae, 0x0b7effab, 0xf2d5f6d7, 0x07d30f7a,
+		0x02a3f194, 0xf32905dc, 0x110d0000,
+	}, {	// 9.8 MHz
+		0x00010002, 0xfffcffee, 0xfffb0032, 0x003fffcd,
+		0xff4effc1, 0x0106014a, 0xff6efd8a, 0xfedd02aa,
+		0x03b0ff34, 0xfa74fcd7, 0x04bf0781, 0xffaaf6a3,
+		0xf99e066b, 0x0bf90128, 0xf359f5e1, 0x06d20fa2,
+		0x0370f1e5, 0xf2e405a8, 0x110d0000,
+	}, {	// 9.9 MHz
+		0x00000003, 0xffffffee, 0xffef0024, 0x0051fffa,
+		0xff54ff77, 0x00be0184, 0x0006fdad, 0xfe2701f3,
+		0x0413005e, 0xfad1fbba, 0x039007ee, 0x013bf73d,
+		0xf868050a, 0x0c4302a1, 0xf3fdf4fe, 0x05c70fba,
+		0x043bf23c, 0xf2a10575, 0x110d0000,
+	}, {	// 10.0 MHz
+		0x00000003, 0x0003fff1, 0xffe50011, 0x00570027,
+		0xff70ff3c, 0x00620198, 0x009efe01, 0xfd95011a,
+		0x04350183, 0xfb71fad0, 0x023c0812, 0x02c3f811,
+		0xf75e0390, 0x0c5c0411, 0xf4c1f432, 0x04b30fc1,
+		0x0503f297, 0xf2610541, 0x110d0000,
+	}, {	// 10.1 MHz
+		0x00000003, 0x0006fff7, 0xffdffffc, 0x00510050,
+		0xff9dff18, 0xfffc0184, 0x0128fe80, 0xfd32002e,
+		0x04130292, 0xfc4dfa21, 0x00d107ee, 0x0435f91c,
+		0xf6850205, 0x0c430573, 0xf5a1f37d, 0x03990fba,
+		0x05c7f2f8, 0xf222050d, 0x110d0000,
+	}, {	// 10.2 MHz
+		0x00000002, 0x0008fffe, 0xffdfffe7, 0x003f006e,
+		0xffd6ff0f, 0xff96014a, 0x0197ff1f, 0xfd05ff3e,
+		0x03b0037c, 0xfd59f9b7, 0xff5d0781, 0x0585fa56,
+		0xf5e4006f, 0x0bf906c4, 0xf69df2e0, 0x02790fa2,
+		0x0688f35d, 0xf1e604d8, 0x110d0000,
+	}, {	// 10.3 MHz
+		0xffff0001, 0x00090005, 0xffe4ffd6, 0x0025007e,
+		0x0014ff20, 0xff3c00f0, 0x01e1ffd0, 0xfd12fe5c,
+		0x03110433, 0xfe88f996, 0xfdf106d1, 0x06aafbb7,
+		0xf57efed8, 0x0b7e07ff, 0xf7b0f25e, 0x01560f7a,
+		0x0745f3c7, 0xf1ac04a4, 0x110d0000,
+	}, {	// 10.4 MHz
+		0xffffffff, 0x0008000c, 0xffedffcb, 0x0005007d,
+		0x0050ff4c, 0xfef6007e, 0x01ff0086, 0xfd58fd97,
+		0x024104ad, 0xffcaf9c0, 0xfc9905e2, 0x079afd35,
+		0xf555fd46, 0x0ad50920, 0xf8d9f1f6, 0x00310f43,
+		0x07fdf435, 0xf174046f, 0x110d0000,
+	}, {	// 10.5 MHz
+		0xfffffffe, 0x00050011, 0xfffaffc8, 0xffe5006b,
+		0x0082ff8c, 0xfecc0000, 0x01f00130, 0xfdd2fcfc,
+		0x014d04e3, 0x010efa32, 0xfb6404bf, 0x084efec5,
+		0xf569fbc2, 0x0a000a23, 0xfa15f1ab, 0xff0b0efc,
+		0x08b0f4a7, 0xf13f043a, 0x110d0000,
+	}, {	// 10.6 MHz
+		0x0000fffd, 0x00020012, 0x0007ffcd, 0xffc9004c,
+		0x00a4ffd9, 0xfec3ff82, 0x01b401c1, 0xfe76fc97,
+		0x004404d2, 0x0245fae8, 0xfa5f0370, 0x08c1005f,
+		0xf5bcfa52, 0x09020b04, 0xfb60f17b, 0xfde70ea6,
+		0x095df51e, 0xf10c0405, 0x110d0000,
+	}, {	// 10.7 MHz
+		0x0000fffd, 0xffff0011, 0x0014ffdb, 0xffb40023,
+		0x00b2002a, 0xfedbff10, 0x0150022d, 0xff38fc6f,
+		0xff36047b, 0x035efbda, 0xf9940202, 0x08ee01f5,
+		0xf649f8fe, 0x07e10bc2, 0xfcb6f169, 0xfcc60e42,
+		0x0a04f599, 0xf0db03d0, 0x110d0000,
+	}, {	// 10.8 MHz
+		0x0000fffd, 0xfffb000d, 0x001dffed, 0xffaafff5,
+		0x00aa0077, 0xff13feb6, 0x00ce026b, 0x000afc85,
+		0xfe3503e3, 0x044cfcfb, 0xf90c0082, 0x08d5037f,
+		0xf710f7cc, 0x069f0c59, 0xfe16f173, 0xfbaa0dcf,
+		0x0aa5f617, 0xf0ad039b, 0x110d0000,
+	}, {	// 10.9 MHz
+		0x0000fffe, 0xfff90006, 0x00210003, 0xffacffc8,
+		0x008e00b6, 0xff63fe7c, 0x003a0275, 0x00dafcda,
+		0xfd510313, 0x0501fe40, 0xf8cbfefd, 0x087604f0,
+		0xf80af6c2, 0x05430cc8, 0xff7af19a, 0xfa940d4e,
+		0x0b3ff699, 0xf0810365, 0x110d0000,
+	}, {	// 11.0 MHz
+		0x0001ffff, 0xfff8ffff, 0x00210018, 0xffbaffa3,
+		0x006000e1, 0xffc4fe68, 0xffa0024b, 0x019afd66,
+		0xfc990216, 0x0575ff99, 0xf8d4fd81, 0x07d40640,
+		0xf932f5e6, 0x03d20d0d, 0x00dff1de, 0xf9860cbf,
+		0x0bd1f71e, 0xf058032f, 0x110d0000,
+	}, {	// 11.1 MHz
+		0x00010000, 0xfff8fff8, 0x001b0029, 0xffd1ff8a,
+		0x002600f2, 0x002cfe7c, 0xff0f01f0, 0x023bfe20,
+		0xfc1700fa, 0x05a200f7, 0xf927fc1c, 0x06f40765,
+		0xfa82f53b, 0x02510d27, 0x0243f23d, 0xf8810c24,
+		0x0c5cf7a7, 0xf03102fa, 0x110d0000,
+	}, {	// 11.2 MHz
+		0x00010002, 0xfffafff2, 0x00110035, 0xfff0ff81,
+		0xffe700e7, 0x008ffeb6, 0xfe94016d, 0x02b0fefb,
+		0xfbd3ffd1, 0x05850249, 0xf9c1fadb, 0x05de0858,
+		0xfbf2f4c4, 0x00c70d17, 0x03a0f2b8, 0xf7870b7c,
+		0x0cdff833, 0xf00d02c4, 0x110d0000,
+	}, {	// 11.3 MHz
+		0x00000003, 0xfffdffee, 0x00040038, 0x0010ff88,
+		0xffac00c2, 0x00e2ff10, 0xfe3900cb, 0x02f1ffe9,
+		0xfbd3feaa, 0x05210381, 0xfa9cf9c8, 0x04990912,
+		0xfd7af484, 0xff390cdb, 0x04f4f34d, 0xf69a0ac9,
+		0x0d5af8c1, 0xefec028e, 0x110d0000,
+	}, {	// 11.4 MHz
+		0x00000003, 0x0000ffee, 0xfff60033, 0x002fff9f,
+		0xff7b0087, 0x011eff82, 0xfe080018, 0x02f900d8,
+		0xfc17fd96, 0x04790490, 0xfbadf8ed, 0x032f098e,
+		0xff10f47d, 0xfdaf0c75, 0x063cf3fc, 0xf5ba0a0b,
+		0x0dccf952, 0xefcd0258, 0x110d0000,
+	}, {	// 11.5 MHz
+		0x00000003, 0x0004fff1, 0xffea0026, 0x0046ffc3,
+		0xff5a003c, 0x013b0000, 0xfe04ff63, 0x02c801b8,
+		0xfc99fca6, 0x0397056a, 0xfcecf853, 0x01ad09c9,
+		0x00acf4ad, 0xfc2e0be7, 0x0773f4c2, 0xf4e90943,
+		0x0e35f9e6, 0xefb10221, 0x110d0000,
+	}, {	// 11.6 MHz
+		0x00000002, 0x0007fff6, 0xffe20014, 0x0054ffee,
+		0xff4effeb, 0x0137007e, 0xfe2efebb, 0x0260027a,
+		0xfd51fbe6, 0x02870605, 0xfe4af7fe, 0x001d09c1,
+		0x0243f515, 0xfabd0b32, 0x0897f59e, 0xf4280871,
+		0x0e95fa7c, 0xef9701eb, 0x110d0000,
+	}, {	// 11.7 MHz
+		0xffff0001, 0x0008fffd, 0xffdeffff, 0x0056001d,
+		0xff57ff9c, 0x011300f0, 0xfe82fe2e, 0x01ca0310,
+		0xfe35fb62, 0x0155065a, 0xffbaf7f2, 0xfe8c0977,
+		0x03cef5b2, 0xf9610a58, 0x09a5f68f, 0xf3790797,
+		0x0eebfb14, 0xef8001b5, 0x110d0000,
+	}, {	// 11.8 MHz
+		0xffff0000, 0x00080004, 0xffe0ffe9, 0x004c0047,
+		0xff75ff58, 0x00d1014a, 0xfef9fdc8, 0x0111036f,
+		0xff36fb21, 0x00120665, 0x012df82e, 0xfd0708ec,
+		0x0542f682, 0xf81f095c, 0x0a9af792, 0xf2db06b5,
+		0x0f38fbad, 0xef6c017e, 0x110d0000,
+	}, {	// 11.9 MHz
+		0xffffffff, 0x0007000b, 0xffe7ffd8, 0x00370068,
+		0xffa4ff28, 0x00790184, 0xff87fd91, 0x00430392,
+		0x0044fb26, 0xfece0626, 0x0294f8b2, 0xfb990825,
+		0x0698f77f, 0xf6fe0842, 0x0b73f8a7, 0xf25105cd,
+		0x0f7bfc48, 0xef5a0148, 0x110d0000,
+	}, {	// 12.0 MHz
+		0x0000fffe, 0x00050010, 0xfff2ffcc, 0x001b007b,
+		0xffdfff10, 0x00140198, 0x0020fd8e, 0xff710375,
+		0x014dfb73, 0xfd9a059f, 0x03e0f978, 0xfa4e0726,
+		0x07c8f8a7, 0xf600070c, 0x0c2ff9c9, 0xf1db04de,
+		0x0fb4fce5, 0xef4b0111, 0x110d0000,
+	}, {	// 12.1 MHz
+		0x0000fffd, 0x00010012, 0xffffffc8, 0xfffb007e,
+		0x001dff14, 0xffad0184, 0x00b7fdbe, 0xfea9031b,
+		0x0241fc01, 0xfc8504d6, 0x0504fa79, 0xf93005f6,
+		0x08caf9f2, 0xf52b05c0, 0x0ccbfaf9, 0xf17903eb,
+		0x0fe3fd83, 0xef3f00db, 0x110d0000,
+	}, {	// 12.2 MHz
+		0x0000fffd, 0xfffe0011, 0x000cffcc, 0xffdb0071,
+		0x0058ff32, 0xff4f014a, 0x013cfe1f, 0xfdfb028a,
+		0x0311fcc9, 0xfb9d03d6, 0x05f4fbad, 0xf848049d,
+		0x0999fb5b, 0xf4820461, 0x0d46fc32, 0xf12d02f4,
+		0x1007fe21, 0xef3600a4, 0x110d0000,
+	}, {	// 12.3 MHz
+		0x0000fffe, 0xfffa000e, 0x0017ffd9, 0xffc10055,
+		0x0088ff68, 0xff0400f0, 0x01a6fea7, 0xfd7501cc,
+		0x03b0fdc0, 0xfaef02a8, 0x06a7fd07, 0xf79d0326,
+		0x0a31fcda, 0xf40702f3, 0x0d9ffd72, 0xf0f601fa,
+		0x1021fec0, 0xef2f006d, 0x110d0000,
+	}, {	// 12.4 MHz
+		0x0001ffff, 0xfff80007, 0x001fffeb, 0xffaf002d,
+		0x00a8ffb0, 0xfed3007e, 0x01e9ff4c, 0xfd2000ee,
+		0x0413fed8, 0xfa82015c, 0x0715fe7d, 0xf7340198,
+		0x0a8dfe69, 0xf3bd017c, 0x0dd5feb8, 0xf0d500fd,
+		0x1031ff60, 0xef2b0037, 0x110d0000,
+	}, {	// 12.5 MHz
+		0x00010000, 0xfff70000, 0x00220000, 0xffa90000,
+		0x00b30000, 0xfec20000, 0x02000000, 0xfd030000,
+		0x04350000, 0xfa5e0000, 0x073b0000, 0xf7110000,
+		0x0aac0000, 0xf3a40000, 0x0de70000, 0xf0c90000,
+		0x10360000, 0xef290000, 0x110d0000,
+	}, {	// 12.6 MHz
+		0x00010001, 0xfff8fff9, 0x001f0015, 0xffafffd3,
+		0x00a80050, 0xfed3ff82, 0x01e900b4, 0xfd20ff12,
+		0x04130128, 0xfa82fea4, 0x07150183, 0xf734fe68,
+		0x0a8d0197, 0xf3bdfe84, 0x0dd50148, 0xf0d5ff03,
+		0x103100a0, 0xef2bffc9, 0x110d0000,
+	}, {	// 12.7 MHz
+		0x00000002, 0xfffafff2, 0x00170027, 0xffc1ffab,
+		0x00880098, 0xff04ff10, 0x01a60159, 0xfd75fe34,
+		0x03b00240, 0xfaeffd58, 0x06a702f9, 0xf79dfcda,
+		0x0a310326, 0xf407fd0d, 0x0d9f028e, 0xf0f6fe06,
+		0x10210140, 0xef2fff93, 0x110d0000,
+	}, {	// 12.8 MHz
+		0x00000003, 0xfffeffef, 0x000c0034, 0xffdbff8f,
+		0x005800ce, 0xff4ffeb6, 0x013c01e1, 0xfdfbfd76,
+		0x03110337, 0xfb9dfc2a, 0x05f40453, 0xf848fb63,
+		0x099904a5, 0xf482fb9f, 0x0d4603ce, 0xf12dfd0c,
+		0x100701df, 0xef36ff5c, 0x110d0000,
+	}, {	// 12.9 MHz
+		0x00000003, 0x0001ffee, 0xffff0038, 0xfffbff82,
+		0x001d00ec, 0xffadfe7c, 0x00b70242, 0xfea9fce5,
+		0x024103ff, 0xfc85fb2a, 0x05040587, 0xf930fa0a,
+		0x08ca060e, 0xf52bfa40, 0x0ccb0507, 0xf179fc15,
+		0x0fe3027d, 0xef3fff25, 0x110d0000,
+	}, {	// 13.0 MHz
+		0x00000002, 0x0005fff0, 0xfff20034, 0x001bff85,
+		0xffdf00f0, 0x0014fe68, 0x00200272, 0xff71fc8b,
+		0x014d048d, 0xfd9afa61, 0x03e00688, 0xfa4ef8da,
+		0x07c80759, 0xf600f8f4, 0x0c2f0637, 0xf1dbfb22,
+		0x0fb4031b, 0xef4bfeef, 0x110d0000,
+	}, {	// 13.1 MHz
+		0xffff0001, 0x0007fff5, 0xffe70028, 0x0037ff98,
+		0xffa400d8, 0x0079fe7c, 0xff87026f, 0x0043fc6e,
+		0x004404da, 0xfecef9da, 0x0294074e, 0xfb99f7db,
+		0x06980881, 0xf6fef7be, 0x0b730759, 0xf251fa33,
+		0x0f7b03b8, 0xef5afeb8, 0x110d0000,
+	}, {	// 13.2 MHz
+		0xffff0000, 0x0008fffc, 0xffe00017, 0x004cffb9,
+		0xff7500a8, 0x00d1feb6, 0xfef90238, 0x0111fc91,
+		0xff3604df, 0x0012f99b, 0x012d07d2, 0xfd07f714,
+		0x0542097e, 0xf81ff6a4, 0x0a9a086e, 0xf2dbf94b,
+		0x0f380453, 0xef6cfe82, 0x110d0000,
+	}, {	// 13.3 MHz
+		0xffffffff, 0x00080003, 0xffde0001, 0x0056ffe3,
+		0xff570064, 0x0113ff10, 0xfe8201d2, 0x01cafcf0,
+		0xfe35049e, 0x0155f9a6, 0xffba080e, 0xfe8cf689,
+		0x03ce0a4e, 0xf961f5a8, 0x09a50971, 0xf379f869,
+		0x0eeb04ec, 0xef80fe4b, 0x110d0000,
+	}, {	// 13.4 MHz
+		0x0000fffe, 0x0007000a, 0xffe2ffec, 0x00540012,
+		0xff4e0015, 0x0137ff82, 0xfe2e0145, 0x0260fd86,
+		0xfd51041a, 0x0287f9fb, 0xfe4a0802, 0x001df63f,
+		0x02430aeb, 0xfabdf4ce, 0x08970a62, 0xf428f78f,
+		0x0e950584, 0xef97fe15, 0x110d0000,
+	}, {	// 13.5 MHz
+		0x0000fffd, 0x0004000f, 0xffeaffda, 0x0046003d,
+		0xff5affc4, 0x013b0000, 0xfe04009d, 0x02c8fe48,
+		0xfc99035a, 0x0397fa96, 0xfcec07ad, 0x01adf637,
+		0x00ac0b53, 0xfc2ef419, 0x07730b3e, 0xf4e9f6bd,
+		0x0e35061a, 0xefb1fddf, 0x110d0000,
+	}, {	// 13.6 MHz
+		0x0000fffd, 0x00000012, 0xfff6ffcd, 0x002f0061,
+		0xff7bff79, 0x011e007e, 0xfe08ffe8, 0x02f9ff28,
+		0xfc17026a, 0x0479fb70, 0xfbad0713, 0x032ff672,
+		0xff100b83, 0xfdaff38b, 0x063c0c04, 0xf5baf5f5,
+		0x0dcc06ae, 0xefcdfda8, 0x110d0000,
+	}, {	// 13.7 MHz
+		0x0000fffd, 0xfffd0012, 0x0004ffc8, 0x00100078,
+		0xffacff3e, 0x00e200f0, 0xfe39ff35, 0x02f10017,
+		0xfbd30156, 0x0521fc7f, 0xfa9c0638, 0x0499f6ee,
+		0xfd7a0b7c, 0xff39f325, 0x04f40cb3, 0xf69af537,
+		0x0d5a073f, 0xefecfd72, 0x110d0000,
+	}, {	// 13.8 MHz
+		0x0001fffe, 0xfffa000e, 0x0011ffcb, 0xfff0007f,
+		0xffe7ff19, 0x008f014a, 0xfe94fe93, 0x02b00105,
+		0xfbd3002f, 0x0585fdb7, 0xf9c10525, 0x05def7a8,
+		0xfbf20b3c, 0x00c7f2e9, 0x03a00d48, 0xf787f484,
+		0x0cdf07cd, 0xf00dfd3c, 0x110d0000,
+	}, {	// 13.9 MHz
+		0x00010000, 0xfff80008, 0x001bffd7, 0xffd10076,
+		0x0026ff0e, 0x002c0184, 0xff0ffe10, 0x023b01e0,
+		0xfc17ff06, 0x05a2ff09, 0xf92703e4, 0x06f4f89b,
+		0xfa820ac5, 0x0251f2d9, 0x02430dc3, 0xf881f3dc,
+		0x0c5c0859, 0xf031fd06, 0x110d0000,
+	}, {	// 14.0 MHz
+		0x00010001, 0xfff80001, 0x0021ffe8, 0xffba005d,
+		0x0060ff1f, 0xffc40198, 0xffa0fdb5, 0x019a029a,
+		0xfc99fdea, 0x05750067, 0xf8d4027f, 0x07d4f9c0,
+		0xf9320a1a, 0x03d2f2f3, 0x00df0e22, 0xf986f341,
+		0x0bd108e2, 0xf058fcd1, 0x110d0000,
+	}, {	// 14.1 MHz
+		0x00000002, 0xfff9fffa, 0x0021fffd, 0xffac0038,
+		0x008eff4a, 0xff630184, 0x003afd8b, 0x00da0326,
+		0xfd51fced, 0x050101c0, 0xf8cb0103, 0x0876fb10,
+		0xf80a093e, 0x0543f338, 0xff7a0e66, 0xfa94f2b2,
+		0x0b3f0967, 0xf081fc9b, 0x110d0000,
+	}, {	// 14.2 MHz
+		0x00000003, 0xfffbfff3, 0x001d0013, 0xffaa000b,
+		0x00aaff89, 0xff13014a, 0x00cefd95, 0x000a037b,
+		0xfe35fc1d, 0x044c0305, 0xf90cff7e, 0x08d5fc81,
+		0xf7100834, 0x069ff3a7, 0xfe160e8d, 0xfbaaf231,
+		0x0aa509e9, 0xf0adfc65, 0x110d0000,
+	}, {	// 14.3 MHz
+		0x00000003, 0xffffffef, 0x00140025, 0xffb4ffdd,
+		0x00b2ffd6, 0xfedb00f0, 0x0150fdd3, 0xff380391,
+		0xff36fb85, 0x035e0426, 0xf994fdfe, 0x08eefe0b,
+		0xf6490702, 0x07e1f43e, 0xfcb60e97, 0xfcc6f1be,
+		0x0a040a67, 0xf0dbfc30, 0x110d0000,
+	}, {	// 14.4 MHz
+		0x00000003, 0x0002ffee, 0x00070033, 0xffc9ffb4,
+		0x00a40027, 0xfec3007e, 0x01b4fe3f, 0xfe760369,
+		0x0044fb2e, 0x02450518, 0xfa5ffc90, 0x08c1ffa1,
+		0xf5bc05ae, 0x0902f4fc, 0xfb600e85, 0xfde7f15a,
+		0x095d0ae2, 0xf10cfbfb, 0x110d0000,
+	}, {	// 14.5 MHz
+		0xffff0002, 0x0005ffef, 0xfffa0038, 0xffe5ff95,
+		0x00820074, 0xfecc0000, 0x01f0fed0, 0xfdd20304,
+		0x014dfb1d, 0x010e05ce, 0xfb64fb41, 0x084e013b,
+		0xf569043e, 0x0a00f5dd, 0xfa150e55, 0xff0bf104,
+		0x08b00b59, 0xf13ffbc6, 0x110d0000,
+	}, {	// 14.6 MHz
+		0xffff0001, 0x0008fff4, 0xffed0035, 0x0005ff83,
+		0x005000b4, 0xfef6ff82, 0x01ffff7a, 0xfd580269,
+		0x0241fb53, 0xffca0640, 0xfc99fa1e, 0x079a02cb,
+		0xf55502ba, 0x0ad5f6e0, 0xf8d90e0a, 0x0031f0bd,
+		0x07fd0bcb, 0xf174fb91, 0x110d0000,
+	}, {	// 14.7 MHz
+		0xffffffff, 0x0009fffb, 0xffe4002a, 0x0025ff82,
+		0x001400e0, 0xff3cff10, 0x01e10030, 0xfd1201a4,
+		0x0311fbcd, 0xfe88066a, 0xfdf1f92f, 0x06aa0449,
+		0xf57e0128, 0x0b7ef801, 0xf7b00da2, 0x0156f086,
+		0x07450c39, 0xf1acfb5c, 0x110d0000,
+	}, {	// 14.8 MHz
+		0x0000fffe, 0x00080002, 0xffdf0019, 0x003fff92,
+		0xffd600f1, 0xff96feb6, 0x019700e1, 0xfd0500c2,
+		0x03b0fc84, 0xfd590649, 0xff5df87f, 0x058505aa,
+		0xf5e4ff91, 0x0bf9f93c, 0xf69d0d20, 0x0279f05e,
+		0x06880ca3, 0xf1e6fb28, 0x110d0000,
+	}, {	// 14.9 MHz
+		0x0000fffd, 0x00060009, 0xffdf0004, 0x0051ffb0,
+		0xff9d00e8, 0xfffcfe7c, 0x01280180, 0xfd32ffd2,
+		0x0413fd6e, 0xfc4d05df, 0x00d1f812, 0x043506e4,
+		0xf685fdfb, 0x0c43fa8d, 0xf5a10c83, 0x0399f046,
+		0x05c70d08, 0xf222faf3, 0x110d0000,
+	}, {	// 15.0 MHz
+		0x0000fffd, 0x0003000f, 0xffe5ffef, 0x0057ffd9,
+		0xff7000c4, 0x0062fe68, 0x009e01ff, 0xfd95fee6,
+		0x0435fe7d, 0xfb710530, 0x023cf7ee, 0x02c307ef,
+		0xf75efc70, 0x0c5cfbef, 0xf4c10bce, 0x04b3f03f,
+		0x05030d69, 0xf261fabf, 0x110d0000,
+	}, {	// 15.1 MHz
+		0x0000fffd, 0xffff0012, 0xffefffdc, 0x00510006,
+		0xff540089, 0x00befe7c, 0x00060253, 0xfe27fe0d,
+		0x0413ffa2, 0xfad10446, 0x0390f812, 0x013b08c3,
+		0xf868faf6, 0x0c43fd5f, 0xf3fd0b02, 0x05c7f046,
+		0x043b0dc4, 0xf2a1fa8b, 0x110d0000,
+	}, {	// 15.2 MHz
+		0x0001fffe, 0xfffc0012, 0xfffbffce, 0x003f0033,
+		0xff4e003f, 0x0106feb6, 0xff6e0276, 0xfeddfd56,
+		0x03b000cc, 0xfa740329, 0x04bff87f, 0xffaa095d,
+		0xf99ef995, 0x0bf9fed8, 0xf3590a1f, 0x06d2f05e,
+		0x03700e1b, 0xf2e4fa58, 0x110d0000,
+	}, {	// 15.3 MHz
+		0x0001ffff, 0xfff9000f, 0x0009ffc8, 0x00250059,
+		0xff5effee, 0x0132ff10, 0xfee30265, 0xffaafccf,
+		0x031101eb, 0xfa6001e8, 0x05bdf92f, 0xfe1b09b6,
+		0xfafaf852, 0x0b7e0055, 0xf2d50929, 0x07d3f086,
+		0x02a30e6c, 0xf329fa24, 0x110d0000,
+	}, {	// 15.4 MHz
+		0x00010001, 0xfff80009, 0x0015ffca, 0x00050074,
+		0xff81ff9f, 0x013dff82, 0xfe710221, 0x007cfc80,
+		0x024102ed, 0xfa940090, 0x0680fa1e, 0xfc9b09cd,
+		0xfc73f736, 0x0ad501d0, 0xf2740820, 0x08c9f0bd,
+		0x01d40eb9, 0xf371f9f1, 0x110d0000,
+	}, {	// 15.5 MHz
+		0x00000002, 0xfff80002, 0x001effd5, 0xffe5007f,
+		0xffb4ff5b, 0x01280000, 0xfe2401b0, 0x0146fc70,
+		0x014d03c6, 0xfb10ff32, 0x0701fb41, 0xfb3709a1,
+		0xfe00f644, 0x0a000345, 0xf2350708, 0x09b2f104,
+		0x01050eff, 0xf3baf9be, 0x110d0000,
+	}, {	// 15.6 MHz
+		0x00000003, 0xfff9fffb, 0x0022ffe6, 0xffc9007a,
+		0xfff0ff29, 0x00f2007e, 0xfe01011b, 0x01f6fc9e,
+		0x00440467, 0xfbccfdde, 0x0738fc90, 0xf9f70934,
+		0xff99f582, 0x090204b0, 0xf21a05e1, 0x0a8df15a,
+		0x00340f41, 0xf405f98b, 0x110d0000,
+	}, {	// 15.7 MHz
+		0x00000003, 0xfffcfff4, 0x0020fffa, 0xffb40064,
+		0x002fff11, 0x00a400f0, 0xfe0d006e, 0x0281fd09,
+		0xff3604c9, 0xfcbffca2, 0x0726fdfe, 0xf8e80888,
+		0x0134f4f3, 0x07e1060c, 0xf22304af, 0x0b59f1be,
+		0xff640f7d, 0xf452f959, 0x110d0000,
+	}, {	// 15.8 MHz
+		0x00000003, 0x0000fff0, 0x001a0010, 0xffaa0041,
+		0x0067ff13, 0x0043014a, 0xfe46ffb9, 0x02dbfda8,
+		0xfe3504e5, 0xfddcfb8d, 0x06c9ff7e, 0xf81107a2,
+		0x02c9f49a, 0x069f0753, 0xf2500373, 0x0c14f231,
+		0xfe930fb3, 0xf4a1f927, 0x110d0000,
+	}, {	// 15.9 MHz
+		0xffff0002, 0x0003ffee, 0x000f0023, 0xffac0016,
+		0x0093ff31, 0xffdc0184, 0xfea6ff09, 0x02fdfe70,
+		0xfd5104ba, 0xff15faac, 0x06270103, 0xf7780688,
+		0x044df479, 0x05430883, 0xf2a00231, 0x0cbef2b2,
+		0xfdc40fe3, 0xf4f2f8f5, 0x110d0000,
+	}, {	// 16.0 MHz
+		0xffff0001, 0x0006ffef, 0x00020031, 0xffbaffe8,
+		0x00adff66, 0xff790198, 0xff26fe6e, 0x02e5ff55,
+		0xfc99044a, 0x005bfa09, 0x0545027f, 0xf7230541,
+		0x05b8f490, 0x03d20997, 0xf31300eb, 0x0d55f341,
+		0xfcf6100e, 0xf544f8c3, 0x110d0000,
+	}
+};
+
 static void cx23885_dif_setup(struct i2c_client *client, u32 ifHz)
 {
 	u64 pll_freq;
 	u32 pll_freq_word;
+	const u32 *coeffs;

 	v4l_dbg(1, cx25840_debug, client, "%s(%d)\n", __func__, ifHz);

@@ -2763,2889 +3554,26 @@ static void cx23885_dif_setup(struct i2c_client *client, u32 ifHz)

 	v4l_dbg(1, cx25840_debug, client, "%s(%d) again\n", __func__, ifHz);

-	switch (ifHz) {
-	case 3000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001e0024);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x001bfff8);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffb4ff50);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfed8fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe24fe34);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfebaffc7);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d031f);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04f0065d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07010688);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x04c901d6);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfe00f9d3);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf600f342);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf235f337);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf64efb22);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0105070f);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0c460fce);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00070012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00220032);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00370026);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xfff0ff91);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff0efe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe01fdcc);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe0afedb);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x00440224);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0434060c);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0738074e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x06090361);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xff99fb39);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf6fef3b6);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf21af2a5);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf573fa33);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0034067d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0bfb0fb9);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0004000e);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00200038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x004c004f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x002fffdf);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff5cfeb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe0dfd92);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd7ffe03);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36010a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x03410575);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x072607d2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x071804d5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0134fcb7);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf81ff451);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf223f22e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf4a7f94b);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xff6405e8);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0bae0fa4);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00000008);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001a0036);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0056006d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00670030);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffbdff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe46fd8d);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd25fd4f);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35ffe0);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0224049f);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06c9080e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x07ef0627);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x02c9fe45);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf961f513);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf250f1d2);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf3ecf869);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfe930552);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0b5f0f8f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffd0001);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000f002c);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0054007d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0093007c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0024ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfea6fdbb);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd03fcca);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51feb9);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x00eb0392);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06270802);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08880750);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x044dffdb);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfabdf5f8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2a0f193);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf342f78f);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfdc404b9);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0b0e0f78);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffafff9);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0002001b);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0046007d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00ad00ba);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00870000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff26fe1a);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd1bfc7e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fda4);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xffa5025c);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x054507ad);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08dd0847);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x05b80172);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfc2ef6ff);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf313f170);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf2abf6bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfcf6041f);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0abc0f61);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff3);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff50006);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x002f006c);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b200e3);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00dc007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffb9fea0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd6bfc71);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fcb1);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfe65010b);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x042d0713);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08ec0906);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x07020302);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfdaff823);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf3a7f16a);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf228f5f5);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfc2a0384);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0a670f4a);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff7ffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe9fff1);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0010004d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a100f2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x011a00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0053ff44);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdedfca2);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fbef);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd39ffae);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x02ea0638);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08b50987);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x08230483);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xff39f960);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf45bf180);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf1b8f537);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfb6102e7);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x0a110f32);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe1ffdd);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfff00024);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x007c00e5);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013a014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00e6fff8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe98fd0f);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fb67);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc32fe54);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x01880525);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x083909c7);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x091505ee);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x00c7fab3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf52df1b4);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf15df484);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfa9b0249);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x09ba0f19);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 3900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffbfff0);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdeffcf);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffd1fff6);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x004800be);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01390184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x016300ac);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff5efdb1);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fb23);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb5cfd0d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x001703e4);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x077b09c4);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x09d2073c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0251fc18);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf61cf203);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf118f3dc);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf9d801aa);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x09600eff);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffefff4);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe1ffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffbaffca);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x000b0082);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01170198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01c10152);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0030fe7b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fb24);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfac3fbe9);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfea5027f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0683097f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a560867);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d2fd89);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf723f26f);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0e8f341);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf919010a);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x09060ee5);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0002fffb);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe8ffca);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffacffa4);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffcd0036);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00d70184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01f601dc);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00ffff60);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51fb6d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa6efaf5);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfd410103);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x055708f9);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a9e0969);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0543ff02);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf842f2f5);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0cef2b2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf85e006b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x08aa0ecb);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00050003);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff3ffd3);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaaff8b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff95ffe5);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0080014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01fe023f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01ba0050);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35fbf8);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa62fa3b);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfbf9ff7e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x04010836);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0aa90a3d);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069f007f);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf975f395);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0cbf231);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf7a9ffcb);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x084c0eaf);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008000a);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0000ffe4);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb4ff81);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff6aff96);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x001c00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01d70271);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0254013b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36fcbd);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa9ff9c5);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfadbfdfe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x028c073b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a750adf);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e101fa);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfab8f44e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0ddf1be);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf6f9ff2b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x07ed0e94);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0009000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000efff8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc9ff87);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff52ff54);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffb5007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01860270);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02c00210);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0044fdb2);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb22f997);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf9f2fc90);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0102060f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a050b4c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0902036e);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfc0af51e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf106f15a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf64efe8b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x078d0e77);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0019000e);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5ff9e);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4fff25);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff560000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0112023b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f702c0);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014dfec8);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfbe5f9b3);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf947fb41);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xff7004b9);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x095a0b81);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a0004d8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfd65f603);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf144f104);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf5aafdec);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x072b0e5a);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00060012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00200022);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0005ffc1);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff61ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff09ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x008601d7);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f50340);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0241fff0);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfcddfa19);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8e2fa1e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfde30343);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x08790b7f);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad50631);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfec7f6fc);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf198f0bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf50dfd4e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x06c90e3d);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0003000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00220030);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0025ffed);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff87ff15);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfed6ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffed014c);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02b90386);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03110119);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfdfefac4);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8c6f92f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfc6701b7);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x07670b44);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7e0776);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x002df807);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf200f086);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf477fcb1);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x06650e1e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xffff0009);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001e0038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003f001b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffbcff36);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec2feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff5600a5);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0248038d);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b00232);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xff39fbab);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8f4f87f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfb060020);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x062a0ad2);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf908a3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0192f922);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf27df05e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf3e8fc14);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x06000e00);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 4900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffc0002);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00160037);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00510046);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xfff9ff6d);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfed0fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfecefff0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01aa0356);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0413032b);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x007ffcc5);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf96cf812);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf9cefe87);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x04c90a2c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c4309b4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x02f3fa4a);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf30ef046);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf361fb7a);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x059b0de0);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9fffa);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000a002d);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00570067);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0037ffb5);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfefffe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe62ff3d);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00ec02e3);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x043503f6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x01befe05);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa27f7ee);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf8c6fcf8);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x034c0954);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c5c0aa4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x044cfb7e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf3b1f03f);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf2e2fae1);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x05340dc0);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff4);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffd001e);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0051007b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x006e0006);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff48fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe1bfe9a);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x001d023e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x04130488);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x02e6ff5b);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfb1ef812);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7f7fb7f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x01bc084e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c430b72);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x059afcba);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf467f046);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf26cfa4a);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x04cd0da0);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8ffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff00009);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003f007f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00980056);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffa5feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe00fe15);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff4b0170);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b004d7);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x03e800b9);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfc48f87f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf768fa23);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0022071f);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf90c1b);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x06dafdfd);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf52df05e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf1fef9b5);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x04640d7f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe6fff3);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00250072);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00af009c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x000cff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe13fdb8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe870089);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x031104e1);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04b8020f);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfd98f92f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf71df8f0);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfe8805ce);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7e0c9c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0808ff44);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf603f086);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf19af922);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x03fb0d5e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffcffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe0ffe0);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00050056);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b000d1);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0071ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe53fd8c);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfddfff99);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x024104a3);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x054a034d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xff01fa1e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf717f7ed);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfcf50461);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad50cf4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0921008d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf6e7f0bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf13ff891);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x03920d3b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffffff3);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdeffd1);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5002f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x009c00ed);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00cb0000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfebafd94);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd61feb0);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d0422);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05970464);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0074fb41);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf759f721);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfb7502de);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a000d21);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0a2201d4);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf7d9f104);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf0edf804);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x03280d19);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0003fffa);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe3ffc9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc90002);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x007500ef);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x010e007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff3dfdcf);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd16fddd);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x00440365);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x059b0548);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x01e3fc90);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7dff691);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfa0f014d);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x09020d23);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0b0a0318);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf8d7f15a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf0a5f779);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x02bd0cf6);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00060001);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffecffc9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb4ffd4);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x004000d5);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013600f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffd3fe39);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd04fd31);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff360277);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x055605ef);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x033efdfe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf8a5f642);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf8cbffb6);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e10cfb);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0bd50456);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf9dff1be);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf067f6f2);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x02520cd2);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080009);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff8ffd2);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaaffac);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x000200a3);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013c014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x006dfec9);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd2bfcb7);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe350165);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04cb0651);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0477ff7e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf9a5f635);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf7b1fe20);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069f0ca8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0c81058b);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfaf0f231);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf033f66d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x01e60cae);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 5900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0009000e);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0005ffe1);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffacff90);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffc5005f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01210184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00fcff72);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd8afc77);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51003f);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04020669);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05830103);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfad7f66b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf6c8fc93);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x05430c2b);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d0d06b5);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfc08f2b2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf00af5ec);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x017b0c89);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00070012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0012fff5);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffbaff82);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff8e000f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00e80198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01750028);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe18fc75);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99ff15);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x03050636);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0656027f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfc32f6e2);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf614fb17);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d20b87);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d7707d2);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfd26f341);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefeaf56f);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x010f0c64);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00050012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001c000b);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffd1ff84);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff66ffbe);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00960184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01cd00da);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfeccfcb2);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fdf9);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x01e005bc);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06e703e4);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfdabf798);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf599f9b3);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x02510abd);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0dbf08df);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfe48f3dc);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefd5f4f6);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x00a20c3e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0002000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0021001f);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfff0ff97);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff50ff74);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0034014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01fa0179);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff97fd2a);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fcfa);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x00a304fe);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07310525);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xff37f886);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf55cf86e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x00c709d0);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0de209db);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xff6df484);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefcbf481);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0x00360c18);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffe000a);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0021002f);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0010ffb8);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff50ff3b);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffcc00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01fa01fa);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0069fdd4);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fc26);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xff5d0407);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07310638);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x00c9f9a8);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf55cf74e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xff3908c3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0de20ac3);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0093f537);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefcbf410);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xffca0bf2);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffb0003);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001c0037);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x002fffe2);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff66ff17);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff6a007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01cd0251);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0134fea5);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fb8b);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfe2002e0);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06e70713);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0255faf5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf599f658);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfdaf0799);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0dbf0b96);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x01b8f5f5);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefd5f3a3);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xff5e0bca);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9fffb);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00120037);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00460010);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff8eff0f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff180000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01750276);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01e8ff8d);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fb31);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfcfb0198);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x065607ad);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x03cefc64);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf614f592);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfc2e0656);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d770c52);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x02daf6bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xefeaf33b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfef10ba3);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff7fff5);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0005002f);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0054003c);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffc5ff22);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfedfff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00fc0267);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0276007e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51fb1c);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfbfe003e);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05830802);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0529fdec);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf6c8f4fe);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfabd04ff);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d0d0cf6);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x03f8f78f);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf00af2d7);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfe850b7b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff0);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff80020);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00560060);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0002ff4e);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec4ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x006d0225);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02d50166);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35fb4e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb35fee1);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0477080e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x065bff82);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf7b1f4a0);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf9610397);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0c810d80);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0510f869);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf033f278);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfe1a0b52);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffaffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffec000c);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x004c0078);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0040ff8e);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfecafeb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffd301b6);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02fc0235);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36fbc5);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfaaafd90);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x033e07d2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x075b011b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf8cbf47a);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf81f0224);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0bd50def);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0621f94b);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf067f21e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfdae0b29);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 6900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffdffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe3fff6);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0037007f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0075ffdc);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfef2fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff3d0122);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02ea02dd);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0044fc79);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa65fc5d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x01e3074e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x082102ad);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfa0ff48c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf6fe00a9);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0b0a0e43);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0729fa33);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf0a5f1c9);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfd430b00);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0001fff3);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdeffe2);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x001b0076);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x009c002d);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff35fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfeba0076);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x029f0352);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014dfd60);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa69fb53);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x00740688);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08a7042d);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfb75f4d6);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf600ff2d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0a220e7a);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0827fb22);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf0edf17a);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfcd80ad6);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0004fff9);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe0ffd2);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfffb005e);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b0007a);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff8ffe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe53ffc1);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0221038c);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0241fe6e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfab6fa80);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xff010587);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08e90590);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfcf5f556);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf52bfdb3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x09210e95);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0919fc15);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf13ff12f);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfc6e0aab);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00070000);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe6ffc9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffdb0039);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00af00b8);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfff4feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe13ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01790388);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0311ff92);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb48f9ed);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfd980453);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08e306cd);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfe88f60a);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf482fc40);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x08080e93);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x09fdfd0c);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf19af0ea);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfc050a81);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080008);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff0ffc9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc1000d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x009800e2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x005bff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe00fe74);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00b50345);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b000bc);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc18f9a1);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfc4802f9);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x089807dc);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0022f6f0);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf407fada);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x06da0e74);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0ad3fe06);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf1fef0ab);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfb9c0a55);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008000e);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffdffd0);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffafffdf);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x006e00f2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00b8ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe1bfdf8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xffe302c8);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x041301dc);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd1af99e);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfb1e0183);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x080908b5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x01bcf801);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3bdf985);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x059a0e38);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0b99ff03);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf26cf071);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfb330a2a);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00070011);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000affdf);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffa9ffb5);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x003700e6);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01010000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe62fda8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff140219);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x043502e1);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfe42f9e6);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa270000);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x073a0953);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x034cf939);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3a4f845);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x044c0de1);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0c4f0000);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf2e2f03c);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfacc09fe);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00040012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0016fff3);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffafff95);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xfff900c0);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0130007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfecefd89);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe560146);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x041303bc);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xff81fa76);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf96cfe7d);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x063209b1);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x04c9fa93);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3bdf71e);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x02f30d6e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0cf200fd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf361f00e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfa6509d1);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00010010);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001e0008);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc1ff84);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffbc0084);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013e00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff56fd9f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdb8005c);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b00460);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x00c7fb45);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8f4fd07);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x04fa09ce);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x062afc07);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf407f614);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x01920ce0);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0d8301fa);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf3e8efe5);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xfa0009a4);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffd000b);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0022001d);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffdbff82);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff870039);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x012a014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffedfde7);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd47ff6b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x031104c6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0202fc4c);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8c6fbad);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x039909a7);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0767fd8e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf482f52b);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x002d0c39);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0e0002f4);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf477efc2);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf99b0977);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 7900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffa0004);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0020002d);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfffbff91);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff61ffe8);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00f70184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0086fe5c);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd0bfe85);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x024104e5);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0323fd7d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8e2fa79);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x021d093f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0879ff22);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf52bf465);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfec70b79);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0e6803eb);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf50defa5);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf937094a);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fffd);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00190036);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x001bffaf);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4fff99);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00aa0198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0112fef3);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd09fdb9);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d04be);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x041bfecc);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf947f978);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x00900897);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x095a00b9);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf600f3c5);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfd650aa3);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0ebc04de);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf5aaef8e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf8d5091c);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff7fff6);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000e0038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0037ffd7);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff52ff56);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x004b0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0186ffa1);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd40fd16);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x00440452);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04de0029);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf9f2f8b2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfefe07b5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a05024d);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf6fef34d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfc0a09b8);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0efa05cd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf64eef7d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf87308ed);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff0);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00000031);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x004c0005);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff6aff27);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffe4014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01d70057);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdacfca6);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff3603a7);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05610184);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfadbf82e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfd74069f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a7503d6);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf81ff2ff);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfab808b9);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0f2306b5);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf6f9ef72);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf81308bf);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffbffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff30022);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00560032);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff95ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff8000f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01fe0106);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe46fc71);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe3502c7);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x059e02ce);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfbf9f7f2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfbff055b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0aa9054c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf961f2db);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf97507aa);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0f350797);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf7a9ef6d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf7b40890);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffeffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe8000f);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00540058);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffcdff14);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff29007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01f6019e);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff01fc7c);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd5101bf);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x059203f6);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfd41f7fe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfaa903f3);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a9e06a9);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfabdf2e2);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf842068b);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0f320871);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf85eef6e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf7560860);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0002fff2);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe1fff9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00460073);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x000bff34);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfee90000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01c10215);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xffd0fcc5);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99009d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x053d04f1);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfea5f853);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf97d0270);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a5607e4);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfc2ef314);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf723055f);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0f180943);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf919ef75);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf6fa0830);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0005fff8);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdeffe4);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x002f007f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0048ff6b);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec7ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0163025f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00a2fd47);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17ff73);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04a405b2);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0017f8ed);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf88500dc);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x09d208f9);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfdaff370);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf61c0429);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0ee80a0b);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xf9d8ef82);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf6a00800);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0007ffff);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe1ffd4);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0010007a);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x007cffb2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec6ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00e60277);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0168fdf9);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fe50);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x03ce0631);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0188f9c8);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7c7ff43);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x091509e3);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xff39f3f6);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf52d02ea);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0ea30ac9);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfa9bef95);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf64607d0);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00090007);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe9ffca);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfff00065);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a10003);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfee6feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0053025b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0213fed0);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3fd46);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x02c70668);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x02eafadb);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf74bfdae);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x08230a9c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x00c7f4a3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf45b01a6);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0e480b7c);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfb61efae);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf5ef079f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 8900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008000d);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff5ffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffd10043);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b20053);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff24fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffb9020c);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0295ffbb);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fc64);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x019b0654);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x042dfc1c);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf714fc2a);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x07020b21);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0251f575);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf3a7005e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0dd80c24);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfc2aefcd);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf599076e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00060011);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0002ffcf);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffba0018);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00ad009a);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff79fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff260192);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02e500ab);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fbb6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x005b05f7);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0545fd81);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf723fabf);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x05b80b70);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d2f669);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf313ff15);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0d550cbf);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfcf6eff2);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf544073d);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00030012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000fffdd);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffacffea);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x009300cf);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffdcfe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfea600f7);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02fd0190);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51fb46);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xff150554);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0627fefd);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf778f978);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x044d0b87);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0543f77d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2a0fdcf);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0cbe0d4e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfdc4f01d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf4f2070b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00000010);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001afff0);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaaffbf);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x006700ed);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0043feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe460047);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02db0258);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35fb1b);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfddc0473);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06c90082);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf811f85e);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x02c90b66);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069ff8ad);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf250fc8d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0c140dcf);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfe93f04d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf4a106d9);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffc000c);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00200006);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb4ff9c);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x002f00ef);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00a4ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe0dff92);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x028102f7);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36fb37);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfcbf035e);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07260202);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf8e8f778);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x01340b0d);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e1f9f4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf223fb51);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0b590e42);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xff64f083);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf45206a7);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff90005);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0022001a);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc9ff86);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xfff000d7);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00f2ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe01fee5);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01f60362);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0044fb99);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfbcc0222);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07380370);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf9f7f6cc);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xff990a7e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0902fb50);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf21afa1f);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0a8d0ea6);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0034f0bf);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf4050675);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fffe);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001e002b);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5ff81);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffb400a5);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01280000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe24fe50);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01460390);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014dfc3a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb1000ce);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x070104bf);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfb37f65f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfe0009bc);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a00fcbb);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf235f8f8);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x09b20efc);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0105f101);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf3ba0642);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff7);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00150036);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0005ff8c);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff810061);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013d007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe71fddf);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x007c0380);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0241fd13);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa94ff70);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x068005e2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfc9bf633);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfc7308ca);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad5fe30);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf274f7e0);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x08c90f43);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x01d4f147);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf371060f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9fff1);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00090038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0025ffa7);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff5e0012);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013200f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfee3fd9b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xffaa0331);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0311fe15);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa60fe18);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05bd06d1);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfe1bf64a);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfafa07ae);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7effab);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2d5f6d7);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x07d30f7a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x02a3f194);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf32905dc);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffcffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffb0032);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003fffcd);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4effc1);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0106014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff6efd8a);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfedd02aa);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b0ff34);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa74fcd7);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x04bf0781);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xffaaf6a3);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf99e066b);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf90128);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf359f5e1);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x06d20fa2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0370f1e5);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf2e405a8);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 9900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xffffffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffef0024);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0051fffa);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff54ff77);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00be0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0006fdad);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe2701f3);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0413005e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfad1fbba);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x039007ee);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x013bf73d);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf868050a);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c4302a1);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf3fdf4fe);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x05c70fba);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x043bf23c);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf2a10575);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0003fff1);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe50011);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00570027);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff70ff3c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00620198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x009efe01);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd95011a);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x04350183);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb71fad0);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x023c0812);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x02c3f811);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf75e0390);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c5c0411);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf4c1f432);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x04b30fc1);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0503f297);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf2610541);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0006fff7);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdffffc);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00510050);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff9dff18);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfffc0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0128fe80);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd32002e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x04130292);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc4dfa21);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x00d107ee);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0435f91c);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf6850205);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c430573);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf5a1f37d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x03990fba);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x05c7f2f8);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf222050d);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008fffe);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdfffe7);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003f006e);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffd6ff0f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff96014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0197ff1f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd05ff3e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b0037c);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd59f9b7);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xff5d0781);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0585fa56);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf5e4006f);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf906c4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf69df2e0);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x02790fa2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0688f35d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf1e604d8);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00090005);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe4ffd6);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0025007e);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0014ff20);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff3c00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01e1ffd0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd12fe5c);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03110433);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfe88f996);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfdf106d1);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x06aafbb7);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf57efed8);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7e07ff);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf7b0f25e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x01560f7a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0745f3c7);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf1ac04a4);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008000c);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffedffcb);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0005007d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0050ff4c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfef6007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01ff0086);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd58fd97);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x024104ad);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xffcaf9c0);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfc9905e2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x079afd35);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf555fd46);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad50920);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf8d9f1f6);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x00310f43);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x07fdf435);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf174046f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xfffffffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00050011);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffaffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5006b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0082ff8c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfecc0000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01f00130);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdd2fcfc);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d04e3);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x010efa32);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfb6404bf);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x084efec5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf569fbc2);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a000a23);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfa15f1ab);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xff0b0efc);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x08b0f4a7);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf13f043a);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00020012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0007ffcd);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc9004c);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a4ffd9);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec3ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01b401c1);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe76fc97);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x004404d2);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0245fae8);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa5f0370);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08c1005f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf5bcfa52);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x09020b04);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfb60f17b);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfde70ea6);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x095df51e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf10c0405);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xffff0011);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0014ffdb);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb40023);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b2002a);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfedbff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0150022d);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff38fc6f);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36047b);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x035efbda);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf9940202);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08ee01f5);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf649f8fe);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e10bc2);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfcb6f169);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfcc60e42);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0a04f599);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf0db03d0);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffb000d);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001dffed);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaafff5);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00aa0077);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff13feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00ce026b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x000afc85);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe3503e3);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x044cfcfb);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf90c0082);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08d5037f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf710f7cc);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069f0c59);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfe16f173);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfbaa0dcf);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0aa5f617);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf0ad039b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 10900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff90006);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00210003);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffacffc8);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x008e00b6);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff63fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x003a0275);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00dafcda);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd510313);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0501fe40);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8cbfefd);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x087604f0);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf80af6c2);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x05430cc8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xff7af19a);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfa940d4e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0b3ff699);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf0810365);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8ffff);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00210018);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffbaffa3);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x006000e1);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffc4fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffa0024b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x019afd66);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc990216);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0575ff99);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8d4fd81);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x07d40640);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf932f5e6);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d20d0d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x00dff1de);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf9860cbf);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0bd1f71e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf058032f);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff8);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001b0029);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffd1ff8a);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x002600f2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x002cfe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff0f01f0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x023bfe20);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc1700fa);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05a200f7);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf927fc1c);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x06f40765);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfa82f53b);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x02510d27);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0243f23d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf8810c24);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0c5cf7a7);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf03102fa);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffafff2);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00110035);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfff0ff81);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffe700e7);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x008ffeb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe94016d);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02b0fefb);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3ffd1);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05850249);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf9c1fadb);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x05de0858);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfbf2f4c4);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x00c70d17);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x03a0f2b8);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf7870b7c);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0cdff833);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf00d02c4);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffdffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00040038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0010ff88);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffac00c2);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00e2ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe3900cb);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f1ffe9);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3feaa);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05210381);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa9cf9c8);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x04990912);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfd7af484);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xff390cdb);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x04f4f34d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf69a0ac9);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0d5af8c1);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefec028e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0000ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff60033);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x002fff9f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff7b0087);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x011eff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe080018);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f900d8);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17fd96);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x04790490);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfbadf8ed);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x032f098e);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xff10f47d);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfdaf0c75);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x063cf3fc);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf5ba0a0b);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0dccf952);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefcd0258);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0004fff1);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffea0026);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0046ffc3);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff5a003c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013b0000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe04ff63);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02c801b8);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fca6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0397056a);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfcecf853);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x01ad09c9);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x00acf4ad);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfc2e0be7);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0773f4c2);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf4e90943);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0e35f9e6);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefb10221);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0007fff6);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe20014);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0054ffee);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4effeb);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0137007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe2efebb);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0260027a);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51fbe6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x02870605);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfe4af7fe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x001d09c1);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0243f515);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfabd0b32);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0897f59e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf4280871);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0e95fa7c);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef9701eb);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008fffd);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdeffff);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0056001d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff57ff9c);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x011300f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe82fe2e);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01ca0310);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35fb62);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0155065a);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xffbaf7f2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfe8c0977);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x03cef5b2);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf9610a58);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x09a5f68f);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf3790797);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0eebfb14);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef8001b5);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080004);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe0ffe9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x004c0047);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff75ff58);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00d1014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfef9fdc8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0111036f);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36fb21);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x00120665);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x012df82e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfd0708ec);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0542f682);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf81f095c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0a9af792);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf2db06b5);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0f38fbad);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef6c017e);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 11900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0007000b);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe7ffd8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00370068);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffa4ff28);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00790184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff87fd91);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00430392);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0044fb26);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfece0626);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0294f8b2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfb990825);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0698f77f);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf6fe0842);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0b73f8a7);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf25105cd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0f7bfc48);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef5a0148);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00050010);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff2ffcc);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x001b007b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffdfff10);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00140198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0020fd8e);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff710375);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014dfb73);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd9a059f);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x03e0f978);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfa4e0726);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x07c8f8a7);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf600070c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0c2ff9c9);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf1db04de);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0fb4fce5);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef4b0111);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00010012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffffffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfffb007e);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x001dff14);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffad0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00b7fdbe);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfea9031b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0241fc01);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc8504d6);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0504fa79);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf93005f6);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x08caf9f2);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf52b05c0);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0ccbfaf9);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf17903eb);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0fe3fd83);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef3f00db);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffe0011);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000cffcc);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffdb0071);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0058ff32);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff4f014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x013cfe1f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdfb028a);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0311fcc9);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb9d03d6);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05f4fbad);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf848049d);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0999fb5b);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf4820461);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d46fc32);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf12d02f4);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x1007fe21);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef3600a4);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffa000e);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0017ffd9);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc10055);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0088ff68);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff0400f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01a6fea7);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd7501cc);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b0fdc0);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfaef02a8);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06a7fd07);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf79d0326);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a31fcda);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf40702f3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d9ffd72);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0f601fa);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x1021fec0);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef2f006d);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff80007);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001fffeb);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaf002d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a8ffb0);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfed3007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01e9ff4c);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd2000ee);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0413fed8);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa82015c);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0715fe7d);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7340198);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a8dfe69);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3bd017c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0dd5feb8);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0d500fd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x1031ff60);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef2b0037);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff70000);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00220000);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffa90000);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b30000);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec20000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x02000000);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd030000);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x04350000);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa5e0000);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x073b0000);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7110000);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0aac0000);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3a40000);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0de70000);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0c90000);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x10360000);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef290000);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff8fff9);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001f0015);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffafffd3);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a80050);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfed3ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01e900b4);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd20ff12);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x04130128);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa82fea4);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x07150183);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf734fe68);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a8d0197);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf3bdfe84);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0dd50148);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0d5ff03);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x103100a0);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef2bffc9);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffafff2);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00170027);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc1ffab);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00880098);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff04ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01a60159);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd75fe34);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b00240);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfaeffd58);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06a702f9);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf79dfcda);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0a310326);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf407fd0d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d9f028e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf0f6fe06);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x10210140);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef2fff93);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffeffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000c0034);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffdbff8f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x005800ce);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff4ffeb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x013c01e1);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdfbfd76);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03110337);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb9dfc2a);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05f40453);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf848fb63);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x099904a5);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf482fb9f);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0d4603ce);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf12dfd0c);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x100701df);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef36ff5c);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 12900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0001ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffff0038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfffbff82);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x001d00ec);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffadfe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00b70242);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfea9fce5);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x024103ff);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc85fb2a);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05040587);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf930fa0a);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x08ca060e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf52bfa40);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0ccb0507);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf179fc15);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0fe3027d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef3fff25);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0005fff0);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff20034);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x001bff85);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffdf00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0014fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00200272);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff71fc8b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d048d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd9afa61);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x03e00688);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfa4ef8da);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x07c80759);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf600f8f4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0c2f0637);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf1dbfb22);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0fb4031b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef4bfeef);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0007fff5);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe70028);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0037ff98);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffa400d8);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0079fe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff87026f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0043fc6e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x004404da);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfecef9da);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0294074e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfb99f7db);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x06980881);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf6fef7be);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0b730759);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf251fa33);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0f7b03b8);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef5afeb8);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008fffc);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe00017);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x004cffb9);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff7500a8);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00d1feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfef90238);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0111fc91);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff3604df);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0012f99b);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x012d07d2);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfd07f714);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0542097e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf81ff6a4);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x0a9a086e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf2dbf94b);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0f380453);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef6cfe82);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080003);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffde0001);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0056ffe3);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff570064);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0113ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe8201d2);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01cafcf0);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35049e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0155f9a6);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xffba080e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfe8cf689);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x03ce0a4e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xf961f5a8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x09a50971);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf379f869);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0eeb04ec);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef80fe4b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0007000a);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe2ffec);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00540012);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4e0015);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0137ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe2e0145);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0260fd86);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51041a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0287f9fb);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfe4a0802);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x001df63f);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x02430aeb);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfabdf4ce);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x08970a62);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf428f78f);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0e950584);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xef97fe15);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0004000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffeaffda);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0046003d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff5affc4);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013b0000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe04009d);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02c8fe48);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99035a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0397fa96);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfcec07ad);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x01adf637);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x00ac0b53);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfc2ef419);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x07730b3e);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf4e9f6bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0e35061a);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefb1fddf);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00000012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfff6ffcd);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x002f0061);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff7bff79);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x011e007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe08ffe8);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f9ff28);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17026a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0479fb70);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfbad0713);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x032ff672);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xff100b83);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xfdaff38b);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x063c0c04);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf5baf5f5);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0dcc06ae);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefcdfda8);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffd0012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0004ffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00100078);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffacff3e);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00e200f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe39ff35);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02f10017);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd30156);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0521fc7f);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa9c0638);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0499f6ee);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfd7a0b7c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0xff39f325);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x04f40cb3);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf69af537);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0d5a073f);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xefecfd72);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffa000e);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0011ffcb);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xfff0007f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffe7ff19);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x008f014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe94fe93);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02b00105);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfbd3002f);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x0585fdb7);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf9c10525);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x05def7a8);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfbf20b3c);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x00c7f2e9);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x03a00d48);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf787f484);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0cdf07cd);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf00dfd3c);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 13900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010000);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff80008);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001bffd7);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffd10076);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0026ff0e);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x002c0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff0ffe10);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x023b01e0);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc17ff06);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05a2ff09);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf92703e4);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x06f4f89b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfa820ac5);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0251f2d9);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x02430dc3);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf881f3dc);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0c5c0859);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf031fd06);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff80001);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0021ffe8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffba005d);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0060ff1f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffc40198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xffa0fdb5);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x019a029a);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99fdea);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x05750067);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8d4027f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x07d4f9c0);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf9320a1a);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d2f2f3);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0x00df0e22);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xf986f341);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0bd108e2);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf058fcd1);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9fffa);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0021fffd);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffac0038);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x008eff4a);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff630184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x003afd8b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x00da0326);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd51fced);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x050101c0);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf8cb0103);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x0876fb10);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf80a093e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0543f338);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xff7a0e66);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfa94f2b2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0b3f0967);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf081fc9b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffbfff3);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001d0013);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaa000b);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00aaff89);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff13014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00cefd95);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x000a037b);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe35fc1d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x044c0305);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf90cff7e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08d5fc81);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf7100834);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069ff3a7);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfe160e8d);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfbaaf231);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0aa509e9);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf0adfc65);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xffffffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00140025);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb4ffdd);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00b2ffd6);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfedb00f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x0150fdd3);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xff380391);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff36fb85);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x035e0426);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xf994fdfe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08eefe0b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf6490702);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e1f43e);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfcb60e97);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfcc6f1be);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x0a040a67);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf0dbfc30);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0002ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00070033);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc9ffb4);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00a40027);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfec3007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01b4fe3f);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe760369);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0044fb2e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x02450518);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfa5ffc90);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x08c1ffa1);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf5bc05ae);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0902f4fc);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfb600e85);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xfde7f15a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x095d0ae2);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf10cfbfb);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0005ffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffa0038);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5ff95);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00820074);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfecc0000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01f0fed0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfdd20304);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014dfb1d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x010e05ce);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfb64fb41);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x084e013b);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf569043e);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a00f5dd);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xfa150e55);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0xff0bf104);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x08b00b59);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf13ffbc6);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0008fff4);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffed0035);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0005ff83);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x005000b4);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfef6ff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01ffff7a);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd580269);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0241fb53);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xffca0640);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfc99fa1e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x079a02cb);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf55502ba);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad5f6e0);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf8d90e0a);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0031f0bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x07fd0bcb);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf174fb91);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffffffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0009fffb);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe4002a);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0025ff82);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x001400e0);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff3cff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01e10030);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd1201a4);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0311fbcd);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfe88066a);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xfdf1f92f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x06aa0449);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf57e0128);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7ef801);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf7b00da2);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0156f086);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x07450c39);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf1acfb5c);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00080002);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdf0019);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003fff92);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffd600f1);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff96feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x019700e1);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd0500c2);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b0fc84);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfd590649);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0xff5df87f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x058505aa);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf5e4ff91);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf9f93c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf69d0d20);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0279f05e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x06880ca3);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf1e6fb28);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 14900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x00060009);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffdf0004);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0051ffb0);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff9d00e8);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xfffcfe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x01280180);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd32ffd2);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0413fd6e);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfc4d05df);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x00d1f812);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x043506e4);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf685fdfb);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c43fa8d);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf5a10c83);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0399f046);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x05c70d08);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf222faf3);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0003000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffe5ffef);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x0057ffd9);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff7000c4);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0062fe68);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x009e01ff);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfd95fee6);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0435fe7d);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb710530);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x023cf7ee);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x02c307ef);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf75efc70);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c5cfbef);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf4c10bce);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x04b3f03f);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x05030d69);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf261fabf);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15100000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0000fffd);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xffff0012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xffefffdc);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00510006);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff540089);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00befe7c);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0x00060253);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfe27fe0d);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x0413ffa2);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfad10446);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0390f812);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0x013b08c3);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf868faf6);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0c43fd5f);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf3fd0b02);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x05c7f046);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x043b0dc4);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf2a1fa8b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15200000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001fffe);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffc0012);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0xfffbffce);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x003f0033);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff4e003f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0106feb6);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff6e0276);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xfeddfd56);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x03b000cc);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa740329);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x04bff87f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xffaa095d);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xf99ef995);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0bf9fed8);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf3590a1f);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x06d2f05e);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x03700e1b);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf2e4fa58);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15300000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x0001ffff);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9000f);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0009ffc8);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00250059);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff5effee);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0132ff10);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfee30265);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0xffaafccf);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x031101eb);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa6001e8);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x05bdf92f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfe1b09b6);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfafaf852);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0b7e0055);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2d50929);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x07d3f086);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x02a30e6c);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf329fa24);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15400000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00010001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff80009);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0015ffca);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0x00050074);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xff81ff9f);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x013dff82);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe710221);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x007cfc80);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x024102ed);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfa940090);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0680fa1e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfc9b09cd);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfc73f736);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0ad501d0);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2740820);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x08c9f0bd);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x01d40eb9);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf371f9f1);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15500000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff80002);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001effd5);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffe5007f);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xffb4ff5b);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x01280000);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe2401b0);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0146fc70);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x014d03c6);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfb10ff32);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0701fb41);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xfb3709a1);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xfe00f644);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x0a000345);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2350708);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x09b2f104);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x01050eff);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf3baf9be);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15600000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfff9fffb);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0022ffe6);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffc9007a);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0xfff0ff29);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00f2007e);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe01011b);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x01f6fc9e);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0x00440467);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfbccfdde);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0738fc90);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf9f70934);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0xff99f582);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x090204b0);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf21a05e1);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0a8df15a);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0x00340f41);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf405f98b);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15700000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0xfffcfff4);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x0020fffa);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffb40064);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x002fff11);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x00a400f0);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe0d006e);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x0281fd09);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xff3604c9);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfcbffca2);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0726fdfe);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf8e80888);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x0134f4f3);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x07e1060c);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf22304af);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0b59f1be);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xff640f7d);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf452f959);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15800000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0x00000003);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0000fff0);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x001a0010);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffaa0041);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0067ff13);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0x0043014a);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfe46ffb9);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02dbfda8);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfe3504e5);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xfddcfb8d);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06c9ff7e);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf81107a2);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x02c9f49a);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x069f0753);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2500373);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0c14f231);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfe930fb3);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf4a1f927);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 15900000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0002);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0003ffee);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x000f0023);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffac0016);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x0093ff31);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xffdc0184);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xfea6ff09);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02fdfe70);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfd5104ba);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0xff15faac);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x06270103);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7780688);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x044df479);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x05430883);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf2a00231);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0cbef2b2);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfdc40fe3);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf4f2f8f5);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-
-	case 16000000:
-		cx25840_write4(client, DIF_BPF_COEFF01, 0xffff0001);
-		cx25840_write4(client, DIF_BPF_COEFF23, 0x0006ffef);
-		cx25840_write4(client, DIF_BPF_COEFF45, 0x00020031);
-		cx25840_write4(client, DIF_BPF_COEFF67, 0xffbaffe8);
-		cx25840_write4(client, DIF_BPF_COEFF89, 0x00adff66);
-		cx25840_write4(client, DIF_BPF_COEFF1011, 0xff790198);
-		cx25840_write4(client, DIF_BPF_COEFF1213, 0xff26fe6e);
-		cx25840_write4(client, DIF_BPF_COEFF1415, 0x02e5ff55);
-		cx25840_write4(client, DIF_BPF_COEFF1617, 0xfc99044a);
-		cx25840_write4(client, DIF_BPF_COEFF1819, 0x005bfa09);
-		cx25840_write4(client, DIF_BPF_COEFF2021, 0x0545027f);
-		cx25840_write4(client, DIF_BPF_COEFF2223, 0xf7230541);
-		cx25840_write4(client, DIF_BPF_COEFF2425, 0x05b8f490);
-		cx25840_write4(client, DIF_BPF_COEFF2627, 0x03d20997);
-		cx25840_write4(client, DIF_BPF_COEFF2829, 0xf31300eb);
-		cx25840_write4(client, DIF_BPF_COEFF3031, 0x0d55f341);
-		cx25840_write4(client, DIF_BPF_COEFF3233, 0xfcf6100e);
-		cx25840_write4(client, DIF_BPF_COEFF3435, 0xf544f8c3);
-		cx25840_write4(client, DIF_BPF_COEFF36, 0x110d0000);
-		break;
-	}
+	coeffs = ifhz_coeffs[(ifHz - 3000000) / 100000];
+	cx25840_write4(client, DIF_BPF_COEFF01, coeffs[0]);
+	cx25840_write4(client, DIF_BPF_COEFF23, coeffs[1]);
+	cx25840_write4(client, DIF_BPF_COEFF45, coeffs[2]);
+	cx25840_write4(client, DIF_BPF_COEFF67, coeffs[3]);
+	cx25840_write4(client, DIF_BPF_COEFF89, coeffs[4]);
+	cx25840_write4(client, DIF_BPF_COEFF1011, coeffs[5]);
+	cx25840_write4(client, DIF_BPF_COEFF1213, coeffs[6]);
+	cx25840_write4(client, DIF_BPF_COEFF1415, coeffs[7]);
+	cx25840_write4(client, DIF_BPF_COEFF1617, coeffs[8]);
+	cx25840_write4(client, DIF_BPF_COEFF1819, coeffs[9]);
+	cx25840_write4(client, DIF_BPF_COEFF2021, coeffs[10]);
+	cx25840_write4(client, DIF_BPF_COEFF2223, coeffs[11]);
+	cx25840_write4(client, DIF_BPF_COEFF2425, coeffs[12]);
+	cx25840_write4(client, DIF_BPF_COEFF2627, coeffs[13]);
+	cx25840_write4(client, DIF_BPF_COEFF2829, coeffs[14]);
+	cx25840_write4(client, DIF_BPF_COEFF3031, coeffs[15]);
+	cx25840_write4(client, DIF_BPF_COEFF3233, coeffs[16]);
+	cx25840_write4(client, DIF_BPF_COEFF3435, coeffs[17]);
+	cx25840_write4(client, DIF_BPF_COEFF36, coeffs[18]);
 }

 static void cx23888_std_setup(struct i2c_client *client)
-- 
2.40.1

