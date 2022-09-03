Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2285ABCAB
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 05:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiICDxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 23:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiICDxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 23:53:40 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5469BEA32A
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 20:53:39 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4CF393200258;
        Fri,  2 Sep 2022 23:53:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 02 Sep 2022 23:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662177217; x=1662263617; bh=FTFOsHFRMO
        OtHsoOloWLcDCBE7lpiZEzNFy78OzXZBg=; b=QMGIAl1u4owVUlNW1Cd9tQKeqy
        MzWtwFgy/0t28WOAb4CYREN0TEFoKWuMluzKO1JXSx38rJe+WwEOmIkdfn1okUsh
        DJlH9j2nQEoOXY+iGzAKMVKWS/N/P8fFcLhktw+ApjKjmNQV5wD/BE6xnHcWh6nh
        50ZrYiN5jRr5LJsd+CS4nZNk5lq4465aBWClKUXPwj9ii6yocEj2XfH4ecskwI7D
        jH8FkBiu0xsgswVqjftW8/A1swzOlI5nLFxe0W81hxJDzcI9qzaXlMsBu+QID36o
        zVsb+u2ufCC9aN7zii4KefSgZl5shT2kxnfffpAPuIh5V158nVK/xA8rbG1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662177217; x=1662263617; bh=FTFOsHFRMOOtHsoOloWLcDCBE7lp
        iZEzNFy78OzXZBg=; b=hjywYDKtPhkLyufISchG4dlndemyyf7NN3ODxOJ4LUBY
        J25H7Uwg9e1M31WJunDHQBeywO8MXuWyxhIkGjEmPGhd9q7SgThpvpOUl82ym0JY
        lBtILXoBP6DJ09p5F5rX2vXcOv2WVNaf9csy0Me/pRT2iET0Az9uTmFnNPQ7eXAB
        ejMiDTp4+eS+ALZEzAlUkVvivKjPoE3XC8o9sv9Wsr/P7aKfKPkrFiLwE+bTk9O/
        sLo49q4k1JNFodklVHcoukUgYIzaLSkIlUA4rb8ztWpEu3UFjpuDblXhw7WqLQEt
        /LLFEBsjmdRiq3IINyJAiEJWQzgGWI/627axoXlXRw==
X-ME-Sender: <xms:wc8SYwNrwZAatKWsA_aCAYzxCvuW8tBfSbDgjvscMLBXh9sFUz5N3g>
    <xme:wc8SY29eOfHEZL0MvF87oxroNBVIKCZy65S4XFUFQ-0vZn1k0plK4mbB3dovO8j8Z
    DFIMKPHB0yCCdob4Lo>
X-ME-Received: <xmr:wc8SY3RH-YfzHZL8bR-4Jt9BpS0p4COz4xPlDBAd3zWr3W6gaVET4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeluddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:wc8SY4sQKZegenfLj2NUzQli_pp-FzGpK2EpaZ2glNqngwPTZZ39eg>
    <xmx:wc8SY4exwEfCDj5JPkS7xSxrjv5nEIemu00m05_A2hngHswQsE3hfQ>
    <xmx:wc8SY8185efbndVksB51xA7WQoI9m4Udm2BFmsIwPLuQxiRzG6KRFA>
    <xmx:wc8SYw7PYa8H8o6v_WJ252oIZevOhYvZWLIWaWa21HjaqOu_UzoGPg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 23:53:35 -0400 (EDT)
Date:   Sat, 3 Sep 2022 06:53:33 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH] media: rkisp1: Zero v4l2_subdev_format fields in when
 validating links
Message-ID: <20220903035333.nlhyeeeqlapqdkg3@guri>
References: <20220823171930.9236-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823171930.9236-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.08.2022 20:19, Laurent Pinchart wrote:
>The local sd_fmt variable in rkisp1_capture_link_validate() has
>uninitialized fields, which causes random failures when calling the
>subdev .get_fmt() operation. Fix it by initialization the variable when
>declaring it, which zeros all other fields.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>index 0d5e3373e1f5..28f5bf284314 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>@@ -1394,11 +1394,12 @@ static int rkisp1_capture_link_validate(struct media_link *link)
> 	struct rkisp1_capture *cap = video_get_drvdata(vdev);
> 	const struct rkisp1_capture_fmt_cfg *fmt =
> 		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
>-	struct v4l2_subdev_format sd_fmt;
>+	struct v4l2_subdev_format sd_fmt = {
>+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>+		.pad = link->source->index,
>+	};
> 	int ret;
>
>-	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>-	sd_fmt.pad = link->source->index;
> 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> 	if (ret)
> 		return ret;
>-- 
>Regards,
>
>Laurent Pinchart
>
