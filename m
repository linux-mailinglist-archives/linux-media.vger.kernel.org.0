Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49314E3838
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 06:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbiCVFKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 01:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbiCVFKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 01:10:31 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D9913CD6
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 22:09:04 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C84A55C0195;
        Tue, 22 Mar 2022 01:09:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 22 Mar 2022 01:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=Bsf4s6xZnGkUX3Pl0cr5iuTW9m6asQbJeWr89o
        X/OKU=; b=C6qIW/zJwqftFIH4X1K/Purd20IeAii69GCrUwLB/TSxe08ZkvGDn2
        atzCQ6MD61T1hIjifVkmTwqoHD1rovKyIUKCtUPUMwKgCKh6VQVpgvvBp0mvdSSj
        a5BWlU/IYEy+zdSiTswvQcO7dNV0knAi9Dw4zyGt32hDLkMV6Tn9V890IkOnUUVu
        nD0jf6EI5beXhuqs34pXheaNt/sT/KX29fk0B1hs3Qt78mhihSInFTqowjwBj9H8
        +/p0Ozoy6zu2irQ31+Jra8fwVMo45xijCU0AJgMCYQFIHcaGlXhLs0GZRNj4lPas
        5OyCGEVeeITYUpsT1f8qdIiK0K24OKzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Bsf4s6xZnGkUX3Pl0
        cr5iuTW9m6asQbJeWr89oX/OKU=; b=POrDunUkyn+hAgG0nuSCX1eEJpAjMTlqZ
        Dixyw6+jkEs8+bl07I4unsPVvXi/C7hPKxn2zWsJCoUD4lZthSNUGrSD+rRgFmka
        DJYcNpxV8UXBnqqxqCQqVa0ui3YzMZbQKTAB0K3cMAgVddJpca1nC78BLwJZKD7q
        KdR95vrLMKoFULa1hTYG4XpL0KfjHyks6BNqmquruWvdPN/IzaxWaUvjgcK+Cwwl
        qpvczeMcTgFGRZNhEITh7xnQFFGYSkLga1JBi8zpKHmK55Va5zH5FJz75816Bv54
        ro9BVGSeMlWRW5dR/jpwV7hPXsAQWciDg9rbUJek16tctJIjxVdmg==
X-ME-Sender: <xms:71k5Ys5KLi5L7902sm0HTjyKE7Ydr3VTduVkY6kvNtq87IHaC84EBQ>
    <xme:71k5Yt4JySKYbwf6LaAW4eOZDSd2ca_AUWwBCrc_41UxYD7Cqu5FzzPqdi6CeF8wf
    7ezuw-0FwyYJJgzGk0>
X-ME-Received: <xmr:71k5Yrf_fgIKp3lXpwYmRykURcnD7JgvWIuYjiAqet1tVaB995jgeThyDJ5E43ZnhK8Y7l0kyJ9dlVevYA0fVm1p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:71k5YhK3aN0zcS7qiTTsO1IAnGK5aX1XGq_dnv3L8UL9jXuei6sTxA>
    <xmx:71k5YgLj6_aoohevgtUbrfnr_0fXDoinQMGCWfc_af6bFTt88rc0MQ>
    <xmx:71k5YiwQIpMmjPh5s0A51EwheP_sfJc238GVzHl37YjKwAtUaFwnKA>
    <xmx:71k5YlERHnpyaSoAvmJc684pEUT5QyI7mpc07Hd52T3_kpS4Wv-ZVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 01:09:01 -0400 (EDT)
Date:   Tue, 22 Mar 2022 07:08:59 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 17/17] media: rkisp1: capture: Bypass the main device
 for handling querycap
Message-ID: <20220322050859.scmzeyglcrkge43z@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-18-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-18-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19.03.2022 18:31, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> When handling querycap, the capture node would access the main rkisp1
> device unnecessarily. Get the information from the most direct source.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index a7cf672457cd..94819e6c23e2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1248,11 +1248,8 @@ static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>  static int
>  rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
>  {
> -	struct rkisp1_capture *cap_dev = video_drvdata(file);
> -	struct rkisp1_device *rkisp1 = cap_dev->rkisp1;
> -
> -	strscpy(cap->driver, rkisp1->dev->driver->name, sizeof(cap->driver));
> -	strscpy(cap->card, rkisp1->dev->driver->name, sizeof(cap->card));
> +	strscpy(cap->driver, RKISP1_DRIVER_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, RKISP1_DRIVER_NAME, sizeof(cap->card));
>  	strscpy(cap->bus_info, RKISP1_BUS_INFO, sizeof(cap->bus_info));
>  
>  	return 0;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
