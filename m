Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559627A5C5C
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 10:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjISITx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 04:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjISITr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 04:19:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8635A115
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 01:19:41 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69426FA2;
        Tue, 19 Sep 2023 10:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695111483;
        bh=5KscMuw6xb4tBJcKzeofVbRLdEvtmUDOJZ3CubJxsu0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=rfVzTY5DMBOaatW+id1aQmQT4FPMTxY67j9Px6RrpjVSRPs6EE67VkhguYSiQd0Q+
         JClt7MfrEElyR2H1clDRNh32FGBty9Bh9tPu4XctsylzDae6wnlJ0ECdoXx9l7fYgr
         bEhLHO5WeaRZO/hYqWYShFyJgFoV3YZklKvA3JwA=
Message-ID: <749451b9-b754-fd9c-d0e8-4edb3cb613ac@ideasonboard.com>
Date:   Tue, 19 Sep 2023 11:19:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-12-sakari.ailus@linux.intel.com>
 <20230918133926.GG28874@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230918133926.GG28874@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/09/2023 16:39, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Sep 18, 2023 at 03:51:37PM +0300, Sakari Ailus wrote:
>> Print debug level information on returned frame descriptors.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 35 ++++++++++++++++++++++++++-
>>   1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 7b087be3ff4f..abd9275febdb 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -309,9 +309,42 @@ static int call_set_selection(struct v4l2_subdev *sd,
>>   static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>>   			       struct v4l2_mbus_frame_desc *fd)
>>   {
>> +	unsigned int i;
>> +	int ret;
>> +
>>   	memset(fd, 0, sizeof(*fd));
>>   
>> -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
>> +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(sd->dev, "Frame descriptor\n");
>> +	dev_dbg(sd->dev, "\ttype %s\n",
>> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
>> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
>> +		"unknown");
>> +	dev_dbg(sd->dev, "\tentries %u\n", fd->num_entries);
> 
> You could skip this line, it's implied by the entries that you print
> below.
> 
>> +
>> +	for (i = 0; i < fd->num_entries; i++) {
>> +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
>> +
>> +		dev_dbg(sd->dev, "\tentry %u\n", i);
>> +		dev_dbg(sd->dev, "\tflags%s%s\n",
>> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
>> +			" LEN_MAX" : "",
>> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
>> +			" BLOB" : "");
>> +		dev_dbg(sd->dev, "\t\tstream %u\n", entry->stream);
>> +		dev_dbg(sd->dev, "\t\tpixelcode 0x%4.4x\n", entry->pixelcode);
>> +		dev_dbg(sd->dev, "\t\tlength %u\n", entry->length);
>> +
>> +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +			dev_dbg(sd->dev, "\t\tvc %u\n", entry->bus.csi2.vc);
>> +			dev_dbg(sd->dev, "\t\tdt 0x%2.2x\n", entry->bus.csi2.dt);
> 
> I'd merge those two in a single line.
> 
>> +		}
>> +	}
> 
> All this is a bit verbose. If it was in a hot path I would be annoyed,
> but in this case I suppose it can be useful for debugging and won't
> affect runtime too much.
> 
> It would be nice if we could have a single check and return early. That
> should be possible by using DEFINE_DYNAMIC_DEBUG_METADATA() and
> DYNAMIC_DEBUG_BRANCH(), like done in alloc_contig_dump_pages() for
> instance. It has the additional upside of being able to control all the
> messages with a single flag. I'm not sure it's worth it though, I'll let
> you decide.

Yes, this is very spammy. Maybe instead of:

Frame descriptor
	type CSI-2
	entries 2
	entry 0
	flags LEN_MAX
		stream 0
		pixelcode 0x3012
		length 3194400
		vc 0
		dt 0x2c
	entry 1
	flags LEN_MAX
		stream 1
		pixelcode 0x8003
		length 2904
		vc 0
		dt 0x12


Frame descriptor type CSI-2:
   pad 0 stream 0 code 0x3012 len 3194400 vc 0 dt 0x2c LEN_MAX
   pad 0 stream 1 code 0x8003 len 2904 vc 0 dt 0x12 LEN_MAX

(note: pad is missing in your patch)

  Tomi

