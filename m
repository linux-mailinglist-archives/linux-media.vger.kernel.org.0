Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4855656D119
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 21:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiGJTky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 15:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiGJTkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 15:40:53 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E12312AC9
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 12:40:52 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 24CB95C00FF;
        Sun, 10 Jul 2022 15:40:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 10 Jul 2022 15:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657482048; x=1657568448; bh=z2ln1D3mw/
        WA/USf0NOFQ5xIxofvB946t/dlFqZzj58=; b=HTqAOc8CYTcK1VRxJikS+a4xfL
        3hUEBJKWhu2N7loGku37MGZaAE5xgYcFTZqZbejtk9hsijEEBlwRB/PiQpmwUg0J
        az3EJHiWANtIpoqEwcwUgc3a0rosj8iDWyJ3WvKFv3lgvoGMKDVOQhI8GO8i1ffg
        U1btAFp3KgGR7muZFrsNSlzQri99xWEBVhfSNuV7kFCGrccVO0yAX1RPaJmyruGr
        1MpUX8uhNVSQUlwBdoJuBC8qGBpdWiz53qXR8KQ5S5gSEz6uNw18BZFINGAB/hO3
        zfK8SpvbU+nTy8pf6dGGH3Fsj/hnsR+O4mVtySFymSTQK9iBv/7S3Wr1/A0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657482048; x=1657568448; bh=z2ln1D3mw/WA/USf0NOFQ5xIxofv
        B946t/dlFqZzj58=; b=CXXBaqO+Bmt1DhNKQx9eB/oxt5bCWiBgBmGWSRDJnGVR
        Dm0qvMMEZJDrnj2YR24NFdrtP/2qw0DGHX2QE8+WXEFf9N2GbHbei/Q50dols4eW
        DR2DkHrthxvCD08/kMBmZw6AaFEVwtXM7p6FUYWmSkVTcXTdTCHwIzrxigEJITHu
        DQjJ0GkedOqB2VGWm7X+2d7tVhLlBt04rU4W0fRdVrUPkbe3ce/40hd7sWPeoFw2
        DgJYb/Mc1mpi5F0OAtzFBtjP3PtqTvYPXMG4RkGNcrNndt39ioX9bFLYocgzHrcQ
        d03PfyJ/yzZpdJ+2382ROnO3PXfzi+qGY+Fr4QDSYw==
X-ME-Sender: <xms:PyvLYkMDpwn33H3zX2Gj35E_QvMH05yJf0DW9J_Abkh8zt2e1fYzPg>
    <xme:PyvLYq-xxIzXW2DEsCmyL4joo_e7Ev_WarkKao0nnc7R_KG6vxb-ogbwPUU2fZFWD
    PBRlHUZa68K3dJMvQU>
X-ME-Received: <xmr:PyvLYrQ5Fy4gvYYO0m-Xp3_-PIhDZSSpKuE0SUIjysUKjAfymUm3HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejuddgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:PyvLYsu1jgx9xMplPYAnjyzZXFE4prwQnLv_qme7Ax8Alhnb0Uxb7w>
    <xmx:PyvLYseNf23cIShjp3IyDCjFOiqXzVwwU4BOB-83JdNsq9e0LDJ71A>
    <xmx:PyvLYg3ECv8AhnBRuFRN7UyZoqxhz97RKmo2h09gUCiKGMfu3BnaBQ>
    <xmx:QCvLYr66toh30Y6XqYmHaWSFygXjbfZ22puJD4p4omxWQ22OuPW5kQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 15:40:45 -0400 (EDT)
Date:   Sun, 10 Jul 2022 22:40:41 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 12/55] media: rkisp1: cap: Print debug message on
 failed link validation
Message-ID: <20220710194041.sjw55jpky7g6dov7@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-13-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:06, Laurent Pinchart wrote:
>When a link validation failure occurs, print a debug message to help
>diagnosing the cause.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v1:
>
>- Add missing \n
>---
> .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>index 94819e6c23e2..fb14c8aa154c 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>@@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>
> 	if (sd_fmt.format.height != cap->pix.fmt.height ||
> 	    sd_fmt.format.width != cap->pix.fmt.width ||
>-	    sd_fmt.format.code != fmt->mbus)
>+	    sd_fmt.format.code != fmt->mbus) {
>+		dev_dbg(cap->rkisp1->dev,
>+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
>+			link->source->entity->name, link->source->index,
>+			link->sink->entity->name, link->sink->index,
>+			sd_fmt.format.code, sd_fmt.format.width,
>+			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
>+			cap->pix.fmt.height);
> 		return -EPIPE;
>+	}
>
> 	return 0;
> }
>-- 
>Regards,
>
>Laurent Pinchart
>
