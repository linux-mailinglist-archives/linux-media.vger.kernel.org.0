Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5A0562B18
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 07:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbiGAFxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 01:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbiGAFxt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 01:53:49 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A1C457AB
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 22:53:49 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 79BD75C012D;
        Fri,  1 Jul 2022 01:53:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 01 Jul 2022 01:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656654828; x=1656741228; bh=YdyiHbTjnF
        GVOaDIysYjuAx9ZFjuPXKcWo4G2dbd+GU=; b=KLgjrv/WbxeQzZAtQV5pGeT9oY
        CI/BMBZWwdBqfk3CXZcD/CXLvhZkQZ8OqIFQSFqVKWY0MlHZeZ9GPfhCF9HgFsDO
        uK/2uVUmpXYbL7zDR++c/EXhBXwsdqzs1Ors/VISi9MrJ+yFNzPUDCr8lKy2+67H
        AJYyLjBPk/paHbWPMj60dOQmkenkALuJ4V0MlXgupFqVKawlMEbLYx9/ZVU8qEBV
        eXVt38+IfPMDQ0wDOlXm5heRijXAP+pxEYMAnljamIT65RVIg52kP9uZ9lapbtRe
        zIv87EfL3NQaIgAGacLMTSl90UJZlM38ISIH0EFa04xShsyi59PvzJ3fuHmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656654828; x=1656741228; bh=YdyiHbTjnFGVOaDIysYjuAx9ZFju
        PXKcWo4G2dbd+GU=; b=Ct1UxUFLMwPYmG4ycQ1GzeglfPmMpUfk1JwNpV7Y6dVT
        P7KMig6Q+V4n5LBrZPLtj+Jcpv/X1KQyYQAX1K6dAZqAXgEfWKb4ugujJNxmUn58
        iDpM2Q53du1mAYm8aApkfKEQikaeFwusk3F6j3Ytlh56w2suXhmgzDs7eeObZvzu
        BUMEjGyetBZOgx4Q2XWPi2XxdegHNQE+dOoCzQ3bWClt4NNoz5Ow4yxs7eJU+K8v
        7TcgPHs05d+VGRL69pia5XCxhohcYcTlIwAXe+WvqYf7JewwXBEC6A6RzCy0Y99K
        OhQxqinty0FXKOYGNvTE+2v9dA1vj3CmkiVQNLy7zA==
X-ME-Sender: <xms:7Iu-YvIl-z63J1Ld-V1M3K_ZIXg1c-aE3e9-v8TPa8m8oAeTErXT3g>
    <xme:7Iu-YjKwFJQBkkU3RM8CEVMClOHu9_bdRQOrv_NepZ1-Itn3G2OBvaVQGm83bOgcK
    JsqSfrWhx1Z5IBxM4Q>
X-ME-Received: <xmr:7Iu-YntJlGSkzcBw1_G1v5pkAODsYk1sFEk0E926e2ep85niECMmlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7Iu-YoY3b7mr7mn7tEsJxYJoI88ozRy0J0ih-hKlq12DZidaxzloHg>
    <xmx:7Iu-YmbMCIBy-5eCORA60rKjteelEvfcqclLWrCqtMSxDeMbzOZgcg>
    <xmx:7Iu-YsBHUc4U60KgysjMXd8qz7zINLlKCnnrbQzQMruU93B5N0ny3A>
    <xmx:7Iu-Yu6qskuELVqix_xwwkeVWiYoPcV2EgCiNXr5RhZ-T9_JI0aA0A>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 01:53:45 -0400 (EDT)
Date:   Fri, 1 Jul 2022 08:53:42 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 53/55] media: rkisp1: Shift DMA buffer addresses on
 i.MX8MP
Message-ID: <20220701055342.ryvwbfltt5eemysg@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-54-paul.elder@ideasonboard.com>
 <YrhFHt+PsaWXsTUD@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YrhFHt+PsaWXsTUD@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.06.2022 14:38, Laurent Pinchart wrote:
>Hi Paul,
>
>Thank you for the patch.
>
>On Wed, Jun 15, 2022 at 04:11:25AM +0900, Paul Elder wrote:
>> On the ISP that is integrated in the i.MX8MP, the DMA base addresses are
>> encoded in 34-bit. Shift them to the left by 2 bits so that they can be
>
>I think you meant right, not left.
>
>> contained in 32 bits.
>
>The important part here is that this is how the address is encoded in
>the hardware. I suppose it's obvious, otherwise it woudln't work at all,
>but maybe it could be explained more explicitly ?
>
>On the ISP that is integrated in the i.MX8MP, DMA addresses have been
>extended to 34 bits, with the 32 MSBs stored in the DMA address
>registers and the 2 LSBs set to 0. Shift the buffer addresses right by 2
>on that platform.

If the 32 MSB are all stored in the in the dma address then why do we
need to shift?
>
>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>
>Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> ---
>>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 19 +++++++++++--------
>>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  3 ++-
>>  3 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 35cec263c563..234b1f8488cb 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -624,6 +624,9 @@ static void rkisp1_dummy_buf_destroy(struct rkisp1_capture *cap)
>>
>>  static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>  {
>> +	u8 shift = cap->rkisp1->info->features & RKISP1_FEATURE_DMA_34BIT ?
>> +		   2 : 0;
>> +
>>  	cap->buf.curr = cap->buf.next;
>>  	cap->buf.next = NULL;
>>
>> @@ -636,7 +639,7 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>  		buff_addr = cap->buf.next->buff_addr;
>>
>>  		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
>> -			     buff_addr[RKISP1_PLANE_Y]);
>> +			     buff_addr[RKISP1_PLANE_Y] >> shift);
>>  		/*
>>  		 * In order to support grey format we capture
>>  		 * YUV422 planar format from the camera and
>> @@ -645,17 +648,17 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>  		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
>>  			rkisp1_write(cap->rkisp1,
>>  				     cap->config->mi.cb_base_ad_init,
>> -				     cap->buf.dummy.dma_addr);
>> +				     cap->buf.dummy.dma_addr >> shift);
>>  			rkisp1_write(cap->rkisp1,
>>  				     cap->config->mi.cr_base_ad_init,
>> -				     cap->buf.dummy.dma_addr);
>> +				     cap->buf.dummy.dma_addr >> shift);
>>  		} else {
>>  			rkisp1_write(cap->rkisp1,
>>  				     cap->config->mi.cb_base_ad_init,
>> -				     buff_addr[RKISP1_PLANE_CB]);
>> +				     buff_addr[RKISP1_PLANE_CB] >> shift);
>>  			rkisp1_write(cap->rkisp1,
>>  				     cap->config->mi.cr_base_ad_init,
>> -				     buff_addr[RKISP1_PLANE_CR]);
>> +				     buff_addr[RKISP1_PLANE_CR] >> shift);
>>  		}
>>  	} else {
>>  		/*
>> @@ -663,11 +666,11 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>  		 * throw data if there is no available buffer.
>>  		 */
>>  		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
>> -			     cap->buf.dummy.dma_addr);
>> +			     cap->buf.dummy.dma_addr >> shift);
>>  		rkisp1_write(cap->rkisp1, cap->config->mi.cb_base_ad_init,
>> -			     cap->buf.dummy.dma_addr);
>> +			     cap->buf.dummy.dma_addr >> shift);
>>  		rkisp1_write(cap->rkisp1, cap->config->mi.cr_base_ad_init,
>> -			     cap->buf.dummy.dma_addr);
>> +			     cap->buf.dummy.dma_addr >> shift);
>>  	}
>>
>>  	/* Set plane offsets */
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> index 96657e55a5b0..0b834579d08c 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> @@ -113,6 +113,7 @@ enum rkisp1_feature {
>>  	RKISP1_FEATURE_DUAL_CROP = BIT(1),
>>  	RKISP1_FEATURE_RSZ_CROP = BIT(2),
>>  	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),
>> +	RKISP1_FEATURE_DMA_34BIT = BIT(4),

doc this field

thanks,
Dafna

>>  };
>>
>>  /*
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> index d68a805e8b6b..4c77aa2bc50a 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> @@ -506,7 +506,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
>>  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
>>  	.isp_ver = IMX8MP_V10,
>>  	.features = RKISP1_FEATURE_RSZ_CROP
>> -		  | RKISP1_FEATURE_MAIN_STRIDE,
>> +		  | RKISP1_FEATURE_MAIN_STRIDE
>> +		  | RKISP1_FEATURE_DMA_34BIT,
>>  };
>>
>>  static const struct of_device_id rkisp1_of_match[] = {
>
>-- 
>Regards,
>
>Laurent Pinchart
