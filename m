Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAAE755AE8F
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 06:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbiFZEFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 00:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiFZEFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 00:05:54 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC2411A20
        for <linux-media@vger.kernel.org>; Sat, 25 Jun 2022 21:05:53 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1048932004F8;
        Sun, 26 Jun 2022 00:05:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 26 Jun 2022 00:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1656216349; x=
        1656302749; bh=Fyqr39kqDTapjiaXukIEzLeA3TcvL5aGenhByxOZ9cw=; b=J
        8AFFaMnVAhg2GawAI/FATO47FUO8xQBlsOcvbFN+Zmh5UmhZUv6XhHnsjHktTNH2
        JNobrx56j5L/BIAicY8Itvn88GcCLI9eaNSg1xrQjS4KGwd9SipIHi8pW2kHU/iV
        lY3nzcC4XlePD54BWAJlhtpnLXLxbsdN9JBHw69b5bzWRLVSiqtzKxwKAxE/Y7Ks
        +8nzyqbrKt7O/zCF1YTG5J099s/WUUtQbcPS0FMGAEDxsvWHFgFJtxsGiDWUcLmm
        Yur7Si9UffIUIRzfIrVKM4hlBclUAmaCsHuBbs6Lnn70ubIUd/D/pqgxstifqP9T
        GA7D6T4MWQozAzY96eQGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656216349; x=
        1656302749; bh=Fyqr39kqDTapjiaXukIEzLeA3TcvL5aGenhByxOZ9cw=; b=G
        TC3KbjQah0w1uKFbwbl1a0bsQFYzkExHqIPwF49tUgVX7vqWXmkvb0xwvEA9i6rb
        LexJ8hUAdkRaVdT6YujNw51wVAbJCh+PSqw9oF3v6HGP2Sbx5UPIyUoFgOe+avPt
        QmUQWOsJYNo0NFsW5GVsRfYVh3v4rhuijqIm61zh6L+9PgruiD524aO1s34wJSRw
        bIjgZZHmjSEGFtxkNHYs25QQ6KU5jL3GgV62zyDCAHL+kruY9+15vP1uooXPS86r
        Tk5cpaV+dm4KGufqobqpkNlfDf/8l5DF97BTkNYvZLTUBqzeb0/GV0odcoeGrufQ
        EgzoTILOCXQ6dFYQ2AbLg==
X-ME-Sender: <xms:Hdu3YqLEH-KbHZvcCJXPhjCJA4U0aWKtYcyHsT4MJ4Xp1WfRl6gF-Q>
    <xme:Hdu3YiJhftsREq35a1yrc5maQx2_OudHZdm_yQRs1m0ThCKnspCNAlSX94liXQko_
    hgx6oi5YZPfpEYfLZ4>
X-ME-Received: <xmr:Hdu3Yqs_zP79ovbnFhcGBI-hn_r0ZfiH__exoeSnSMDZgfUeTQTd4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegvddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepteehkefgjeegledtgeffhedtkefgiefgtedvjeelueegudet
    gedvgedufeevkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghsthhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:Hdu3YvYpsj4c_YZoitVxzEakbELpRXVOxBvpEXGZdUWhJmksuDWdmQ>
    <xmx:Hdu3YhammgKatlBsNElt7tKmqJt3To_9o_re93miFkO2u8P1qzbS-Q>
    <xmx:Hdu3YrAXP76bMeWXlkuoO2O6WCiHXLv8ECHtrhPllklUMio7dJFefQ>
    <xmx:Hdu3Yt53qm1lp2IYBlToPYg9h7jC_45VNpMHxa9XCm2Ab2GIaO8sZw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jun 2022 00:05:46 -0400 (EDT)
Date:   Sun, 26 Jun 2022 07:05:43 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Message-ID: <20220626040543.jswxbusyyydfoxfd@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-49-paul.elder@ideasonboard.com>
 <Yq0NnksDldH1PDfp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yq0NnksDldH1PDfp@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18.06.2022 02:26, Laurent Pinchart wrote:
>Hi Paul,
>
>Thank you for the patch.
>
>On Wed, Jun 15, 2022 at 04:11:20AM +0900, Paul Elder wrote:
>> Add match data to the rkisp1 driver to match the i.MX8MP ISP.
>>
>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>> ---
>>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
>>  include/uapi/linux/rkisp1-config.h            |  3 +++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> index 62fa2bd275fe..3a0115bdcee5 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> @@ -486,6 +486,24 @@ static const struct rkisp1_info rk3399_isp_info = {
>>  	.features = RKISP1_FEATURE_MIPI_CSI2,
>>  };
>>
>> +static const char * const imx8mp_isp_clks[] = {
>> +	"isp",
>> +	"hclk",
>> +	"aclk",
>> +};
>> +
>> +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
>> +	{ NULL, rkisp1_isr },
>> +};
>> +
>> +static const struct rkisp1_info imx8mp_isp_info = {
>> +	.clks = imx8mp_isp_clks,
>> +	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
>> +	.isrs = imx8mp_isp_isrs,
>> +	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
>> +	.isp_ver = IMX8MP_V10,
>> +};
>> +
>>  static const struct of_device_id rkisp1_of_match[] = {
>>  	{
>>  		.compatible = "rockchip,px30-cif-isp",
>> @@ -495,6 +513,10 @@ static const struct of_device_id rkisp1_of_match[] = {
>>  		.compatible = "rockchip,rk3399-cif-isp",
>>  		.data = &rk3399_isp_info,
>>  	},
>> +	{
>> +		.compatible = "fsl,imx8mp-isp",
>> +		.data = &imx8mp_isp_info,
>> +	},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>> index 583ca0d9a79d..40677d47825c 100644
>> --- a/include/uapi/linux/rkisp1-config.h
>> +++ b/include/uapi/linux/rkisp1-config.h
>> @@ -140,12 +140,15 @@
>>   * @RKISP1_V11: declared in the original vendor code, but not used
>>   * @RKISP1_V12: used at least in rk3326 and px30
>>   * @RKISP1_V13: used at least in rk1808
>> + * @IMX8MP_V10: used in at least imx8mp
>>   */
>>  enum rkisp1_cif_isp_version {
>>  	RKISP1_V10 = 10,
>>  	RKISP1_V11,
>>  	RKISP1_V12,
>>  	RKISP1_V13,
>> +	/* TODO Choose a better version for this */
>> +	IMX8MP_V10,
>
>Time to address this ? :-)
>
>Does anyone know where the current versioning scheme come from ?

It was added by Heiko Stübner, basically trying to figure out the
versions from the vedor code,
see https://lore.kernel.org/all/20210121144407.9045-6-dafna.hirschfeld@collabora.com/

thanks,
Dafna

>
>>  };
>>
>>  enum rkisp1_cif_isp_histogram_mode {
>
>-- 
>Regards,
>
>Laurent Pinchart
