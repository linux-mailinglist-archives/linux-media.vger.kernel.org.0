Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BBD572356
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbiGLSq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 14:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbiGLSpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 14:45:45 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998D0DC18F
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 11:42:42 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 8B3143200893;
        Tue, 12 Jul 2022 14:42:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jul 2022 14:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657651361; x=1657737761; bh=HpjzQni4lQ
        mNhSxmuAfTDeTcCNmiq8c1Rj6unWmum/c=; b=X8i2jvWR+B05rPqKOvOPCf56se
        YcyHQufSI7sBqFJlENYtCLlkb+XQKAO9qmgoZM2qYc8J3Svti8KcvmgCql13y1Is
        ePC0Sm066WcJuWzTeNw6luwI5BTSkA2o6ajz8qi9cXp4yUzBGtZUiuf89YJXQmsh
        P+oS8Ms/pntHL4z48ahltsPYVp8Sznnlc19Tdq+8/69qwYr4vRkPMtNaWYZW23Wd
        QEEaMCMEEMg0U7/lweD8rYSCmIMKilNnKqvV/uhotb9/S3Ey/vDmjeCCSjBwdFv7
        O9WAWWIMFcF06UKL6dltD81SF05XuCnuniTgbbTrplng/grd6htf4KLwj1fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657651361; x=1657737761; bh=HpjzQni4lQmNhSxmuAfTDeTcCNmi
        q8c1Rj6unWmum/c=; b=F4KbEX5RsiiuSrCVY4tZVFknfJ2krKQxuRpht7hIO2An
        SpEmx+UlCcME+gSZ3AW0AMIydW0+sxbfF3TuC/TOGMEQS5PPe1Q5YLIbC5LwguQC
        w9a8g++4vUEKiRinBXTc0MQHheOlWuJ/3IwacaptvcxVVjpMP774MNKflMrZpqsj
        oZS8iNXf4M6WiSHgx0IbPkd0zyNSGvUYE/iGRYPMLwK0OySGUahzbrNzQSTiX2UY
        cyJHK4KMIlsUmn3lVYg5GmOKR6ig+sJXHOuFj0MD6JFeudrHjuGOBnX4eVFZVD2p
        iO9MQN2FfMKaA/SNo+Q8xuFNkgTm1KZBeIT170Nr1w==
X-ME-Sender: <xms:oMDNYtlKkj-TiSI0RBU50H8u6EEDqn63lGDAs__Dgjd4bnI9OA9p3w>
    <xme:oMDNYo3wivbpcXUsDtFxaptOheF-N5JzV7WVPPI2F8MC5LDIc_FxxXUkuCg8_I6mp
    2YUKfV_E0UfLXZIaUI>
X-ME-Received: <xmr:oMDNYjpyo8wk5spmjkDVBifFPxpoW94YgwcXeMAM9rlJU3wFfpNLlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ocDNYtkqk9ixAJ0lJyzuLKKth5BP14EBhLIaf42rSdrx_e_VWgxZOg>
    <xmx:ocDNYr34d1lAYZRm_BITRizsugOCmO4yH4KM9VFUYZ8bmyIQvYvQPg>
    <xmx:ocDNYstSsZbXdvZAHk54EKW3cDUPb3PgZC8mfl-AJL2eelwcsWkokQ>
    <xmx:ocDNYmRsynxb8p_VtWhGsEIJMo59yDU5P5lhRkLO1ne8O3frhofL5Q>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 14:42:38 -0400 (EDT)
Date:   Tue, 12 Jul 2022 21:42:36 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v3 46/46] media: rkisp1: debug: Add dump file in debugfs
 for MI main path registers
Message-ID: <20220712184236.fr5xrmtqicwycsir@guri>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-47-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220711124248.2683-47-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11.07.2022 15:42, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>Add a register dump file in debugfs for some of the buffer-related
>registers for the main path in MI (for the base address, the size, and
>the offset). Also dump the corresponding shadow registers.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v2:
>
>- Rename file from mi_mp_y_bufs to mi_mp
>---
> .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++++++++
> 1 file changed, 21 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>index e76dc2b164b6..71df3dc95e6f 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>@@ -121,6 +121,24 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> }
> DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
>
>+static int rkisp1_debug_dump_mi_mp_show(struct seq_file *m, void *p)
>+{
>+	static const struct rkisp1_debug_register registers[] = {
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT2),
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_SHD),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_SHD),
>+		RKISP1_DEBUG_REG(MI_MP_Y_OFFS_CNT_SHD),
>+		{ /* Sentinel */ },
>+	};
>+	struct rkisp1_device *rkisp1 = m->private;
>+
>+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
>+}
>+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp);
>+
> #define RKISP1_DEBUG_DATA_COUNT_BINS	32
> #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
>
>@@ -214,6 +232,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> 	debugfs_create_file("srsz", 0444, regs_dir,
> 			    &rkisp1->resizer_devs[RKISP1_SELFPATH],
> 			    &rkisp1_debug_dump_rsz_regs_fops);
>+
>+	debugfs_create_file("mi_mp", 0444, regs_dir, rkisp1,
>+			    &rkisp1_debug_dump_mi_mp_fops);
> }
>
> void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
>-- 
>Regards,
>
>Laurent Pinchart
>
