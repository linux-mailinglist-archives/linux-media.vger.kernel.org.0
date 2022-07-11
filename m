Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED725701A2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiGKMEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiGKMEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:04:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A72CD11C
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:04:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42ADA326;
        Mon, 11 Jul 2022 14:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657541077;
        bh=kohtYCBqjedD034cw6pp1EIO4lNH1yHH1Q5bUGoDebI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIrrqEzNIw6rk82M5eEYDwc8JaHwyoKqRUqJqcmT+fUfaDWbpMnk/rVj1/7fIPFy6
         c5sWmRufFLL4x6kWRgaSuTytVBCAXugnP4UZ5DjihgtaBM6oi5k04EgW9pPFDWNptX
         uxzbPfV2ku2/gI16C8FnJdEkYmmOh0KsYr+CM6TY=
Date:   Mon, 11 Jul 2022 15:04:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 46/55] media: rkisp1: debug: Add dump file in debugfs
 for MI buffer registers
Message-ID: <YswRuuTUpVSkTPm4@pendragon.ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-47-laurent.pinchart@ideasonboard.com>
 <20220711025107.xkws7mliucwxjjgn@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220711025107.xkws7mliucwxjjgn@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Jul 11, 2022 at 05:51:07AM +0300, Dafna Hirschfeld wrote:
> On 01.07.2022 02:07, Laurent Pinchart wrote:
> >From: Paul Elder <paul.elder@ideasonboard.com>
> >
> >Add a register dump file in debugfs for some of the buffer-related
> >registers in MI, for the base address, the size, and the offset. Also
> >dump the appropriate shadow registers.
> >
> >Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> >---
> > .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++++++++
> > 1 file changed, 21 insertions(+)
> >
> >diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> >index e76dc2b164b6..1a59c00fabdd 100644
> >--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> >+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> >@@ -121,6 +121,24 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> > }
> > DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
> >
> >+static int rkisp1_debug_dump_mi_mp_y_offs_cnt_show(struct seq_file *m, void *p)
> >+{
> >+	static const struct rkisp1_debug_register registers[] = {
> >+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT2),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_SHD),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_SHD),
> >+		RKISP1_DEBUG_REG(MI_MP_Y_OFFS_CNT_SHD),
> >+		{ /* Sentinel */ },
> >+	};
> >+	struct rkisp1_device *rkisp1 = m->private;
> >+
> >+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
> >+}
> >+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp_y_offs_cnt);
> >+
> > #define RKISP1_DEBUG_DATA_COUNT_BINS	32
> > #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> >
> >@@ -214,6 +232,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> > 	debugfs_create_file("srsz", 0444, regs_dir,
> > 			    &rkisp1->resizer_devs[RKISP1_SELFPATH],
> > 			    &rkisp1_debug_dump_rsz_regs_fops);
> >+
> >+	debugfs_create_file("mi_mp_y_bufs", 0444, regs_dir, rkisp1,
> >+			    &rkisp1_debug_dump_mi_mp_y_offs_cnt_fops);
> 
> You didn't change the file name as Laurent suggested

I've fixed that locally, will be included in v3.

> > }
> >
> > void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart
