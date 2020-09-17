Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D7026D836
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgIQJ6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:58:24 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47041 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbgIQJ6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:58:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IqgCkLc7zPTBMIqgDklSPc; Thu, 17 Sep 2020 11:58:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600336698; bh=t/9TQo3dCOqLe5jsrSGlAb5C4otJL3yOTa4XWDtGq0o=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WrSxoaSsRzOt0FNQ14LuDW14LEOvTOY1Q6JIkRduKGhMRlLvZ7KCogQH+YFexj3SM
         BMgG4K9Hs/CiMPUP7aGFqiaB2DT/PduYNr57sP+tEmMPGzx+IhMGk+LoLjq/R9RRh6
         scAINVshllQ7T176Yh/69d4DCHdrifKdSI648Cx+V6szxDtWxxxb6kQFQBHLNzSBNE
         7Dql21BZOAWT9jRzHQFDzHtseED11gI21I8iVFtprWnHCBJTMrWq9+3cNB2oKodD8f
         bK4hu0fqCqNaSZZwREj8N5+AOhFXiRaVydyakNvR8PLSnVHfj6yQjqOIr+kjYPVfW/
         nWkmg0nb+V06w==
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on bus_width
 and data_shift
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a153e31a-4115-db74-9b21-3e0cbcd8993d@xs4all.nl>
Message-ID: <be419827-86b4-8aa2-2c82-2c7e328889c3@xs4all.nl>
Date:   Thu, 17 Sep 2020 11:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a153e31a-4115-db74-9b21-3e0cbcd8993d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP9JdqowiXrpH53EONZIxx22rbB9EGblkfY6Ag+J+xMHGx9At6xTa5I4ADtViAKXmIMH0u7qDguAv8dHswyJZ4vzXxGNe5SfrJyoZUaLkFgK6MIK/68v
 MdY7BknEGksQMKQ7AIhFgioHsVe2BN+kLmhGs+rCrOpY03HFq8HJalNJWYVksw1DQf2qsLgFbotkXFMEhpwFUKG1Fe1g2kMS+ICxLP6qRE/L36q7EAu4Ekbf
 edXBapBf3oWBkfmz8tzb8dzKmgeMfJeKhsyXvI6bKwzvmnq9MDs6cJitJ4IAYj4djFc4f6IPNR0f6IOkUp8b2gzpNN1FqaOtAxwU2GupOkeeWJ4oPdBnwG2d
 AZnihnKFAK7N/KCmZbjeHfozFsOouqjTn7k8Y+qCexRCICP85ggNgi6RF943BDF6JS59WNNDqjlffNG6ksFuLxJa8dKJOT5iEUa7QuccCtLD33EB3gpJonsy
 eet1+D5S4g1hjHJkE7vIaE+YKEVe8szbXy6KYdXpu1liP4hhlBn45AQf7g1WJu9Ampa7JwD0tWkvrUxpLtu5dMiSzclS7dZU0qRr0u3YWRQ56P7xt1VM7tk/
 XQXuISw8qBKaLrDEoIAeOUVmTzEfttVTShmOsZZEQMoBsQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/09/2020 10:57, Hans Verkuil wrote:
> Hi Prabhakar,
> 
> Can you rebase this patch? It no longer applies.

Never mind, my mistake. When I was preparing this patch I also had this patch
applied: https://patchwork.linuxtv.org/project/linux-media/patch/1595602732-25582-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com/

And that caused the conflict with this YDS patch.

However, I backed out the two renesas-vin-ycbcr-8b-g patches since there were a
bunch comments for https://patchwork.linuxtv.org/project/linux-media/patch/1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com/

So after dropping those two patches this YDS patch now applies fine and will
be included in the PR.

Sorry for the confusion,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> On 13/09/2020 20:16, Lad Prabhakar wrote:
>> Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
>> for MEDIA_BUS_FMT_UYVY8_2X8 format.
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> ---
>> Changes for v3:
>> * Dropped BIT macro
>> * Introduced struct v4l2_fwnode_bus_parallel
>>
>> Changes for v2:
>> * Dropped DT binding documentation patch
>> * Select the data pins depending on bus-width and data-shift
>>
>> v1 -
>> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
>> ---
>>  drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
>>  drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
>>  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
>>  3 files changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
>> index 7440c8965d27..1149ab76cf5c 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
>> @@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
>>  
>>  	switch (vin->parallel->mbus_type) {
>>  	case V4L2_MBUS_PARALLEL:
>> -		vin_dbg(vin, "Found PARALLEL media bus\n");
>> -		vin->parallel->mbus_flags = vep->bus.parallel.flags;
>> -		break;
>>  	case V4L2_MBUS_BT656:
>> -		vin_dbg(vin, "Found BT656 media bus\n");
>> -		vin->parallel->mbus_flags = 0;
>> +		vin_dbg(vin, "Found %s media bus\n",
>> +			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
>> +			"PARALLEL" : "BT656");
>> +		vin->parallel->bus = vep->bus.parallel;
>>  		break;
>>  	default:
>>  		vin_err(vin, "Unknown media bus type\n");
>> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
>> index a5dbb90c5210..d067439b0b0d 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
>> @@ -125,6 +125,7 @@
>>  #define VNDMR2_VPS		(1 << 30)
>>  #define VNDMR2_HPS		(1 << 29)
>>  #define VNDMR2_CES		(1 << 28)
>> +#define VNDMR2_YDS		(1 << 22)
>>  #define VNDMR2_FTEV		(1 << 17)
>>  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
>>  
>> @@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
>>  
>>  	if (!vin->is_csi) {
>>  		/* Hsync Signal Polarity Select */
>> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
>> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
>>  			dmr2 |= VNDMR2_HPS;
>>  
>>  		/* Vsync Signal Polarity Select */
>> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
>> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
>>  			dmr2 |= VNDMR2_VPS;
>>  
>>  		/* Data Enable Polarity Select */
>> -		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
>> +		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
>>  			dmr2 |= VNDMR2_CES;
>> +
>> +		switch (vin->mbus_code) {
>> +		case MEDIA_BUS_FMT_UYVY8_2X8:
>> +			if (vin->parallel->bus.bus_width == 8 &&
>> +			    vin->parallel->bus.data_shift == 8)
>> +				dmr2 |= VNDMR2_YDS;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>>  	}
>>  
>>  	/*
>> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
>> index c19d077ce1cb..8396e0e45478 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
>> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
>> @@ -19,6 +19,7 @@
>>  #include <media/v4l2-ctrls.h>
>>  #include <media/v4l2-dev.h>
>>  #include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>>  #include <media/videobuf2-v4l2.h>
>>  
>>  /* Number of HW buffers */
>> @@ -92,7 +93,7 @@ struct rvin_video_format {
>>   * @asd:	sub-device descriptor for async framework
>>   * @subdev:	subdevice matched using async framework
>>   * @mbus_type:	media bus type
>> - * @mbus_flags:	media bus configuration flags
>> + * @bus:	media bus parallel configuration
>>   * @source_pad:	source pad of remote subdevice
>>   * @sink_pad:	sink pad of remote subdevice
>>   *
>> @@ -102,7 +103,7 @@ struct rvin_parallel_entity {
>>  	struct v4l2_subdev *subdev;
>>  
>>  	enum v4l2_mbus_type mbus_type;
>> -	unsigned int mbus_flags;
>> +	struct v4l2_fwnode_bus_parallel bus;
>>  
>>  	unsigned int source_pad;
>>  	unsigned int sink_pad;
>>
> 

