Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF26283646
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 15:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgJENJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 09:09:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgJENJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 09:09:12 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8CC73B;
        Mon,  5 Oct 2020 15:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601903351;
        bh=k2ECIvZvPTjoE1vAeB2yuA9QhPH79Ws/P2EgIz5p7b8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t1w+6DUSfFhtCxX4+dC8E2wd0DDuCAxr7PaqNIuU1VyPwRmDsUqUg30EQdfFIud0e
         lpzOFr91TGxbA9oMhzLqeQXtTo+L6eXqimQxRegFC6VdInPMn2Fm4zjqsp8vuJR//X
         pwld8mVxcwdtJozn89HuiPXYBiOnAFDm2a5mXTUU=
Date:   Mon, 5 Oct 2020 16:08:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan =?utf-8?Q?Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>
Subject: Re: [PATCH v2 5/5] media: mt9p031: Fix corrupted frame after
 restarting stream
Message-ID: <20201005130831.GR3931@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-5-s.riedmueller@phytec.de>
 <20201002000549.GK3722@pendragon.ideasonboard.com>
 <3c8853a6-de34-014d-d10a-d6a55083c4bf@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c8853a6-de34-014d-d10a-d6a55083c4bf@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Mon, Oct 05, 2020 at 11:28:21AM +0200, Stefan Riedmüller wrote:
> On 02.10.20 02:05, Laurent Pinchart wrote:
> > On Wed, Sep 30, 2020 at 12:51:33PM +0200, Stefan Riedmueller wrote:
> >> From: Dirk Bender <d.bender@phytec.de>
> >>
> >> To prevent corrupted frames after starting and stopping the sensor it's
> > 
> > s/it's/its/
> 
> thanks, I'll fix that.
> 
> >> datasheet specifies a specific pause sequence to follow:
> >>
> >> Stopping:
> >> 	Set Pause_Restart Bit -> Set Restart Bit -> Set Chip_Enable Off
> >>
> >> Restarting:
> >> 	Set Chip_Enable On -> Clear Pause_Restart Bit
> >>
> >> The Restart Bit is cleared automatically and must not be cleared
> >> manually as this would cause undefined behavior.
> >>
> >> Signed-off-by: Dirk Bender <d.bender@phytec.de>
> >> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >> No changes in v2
> >> ---
> >>   drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
> >>   1 file changed, 25 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> >> index d10457361e6c..d59f66e3dcf3 100644
> >> --- a/drivers/media/i2c/mt9p031.c
> >> +++ b/drivers/media/i2c/mt9p031.c
> >> @@ -80,6 +80,8 @@
> >>   #define		MT9P031_PIXEL_CLOCK_SHIFT(n)		((n) << 8)
> >>   #define		MT9P031_PIXEL_CLOCK_DIVIDE(n)		((n) << 0)
> >>   #define MT9P031_FRAME_RESTART				0x0b
> >> +#define		MT9P031_FRAME_RESTART_SET		(1 << 0)
> >> +#define		MT9P031_FRAME_PAUSE_RESTART_SET		(1 << 1)
> > 
> > The fields are named Restart and Pause_Restart, I would drop _SET. Could
> > you also sort them from MSB to LSB as for the other registers ? Using
> > BIT() would be good too, although this could be done as an additional
> > patch to convert all the existing macros.
> 
> I'll do that. Also I will rename the register to MT9P031_RESTART and the 
> bits to MT9P031_FRAME_RESTART and MT9P031_FRAME_PAUSE_RESTART.
> 
> >>   #define MT9P031_SHUTTER_DELAY				0x0c
> >>   #define MT9P031_RST					0x0d
> >>   #define		MT9P031_RST_ENABLE			1
> >> @@ -483,9 +485,25 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
> >>   static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
> >>   {
> >>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> >> +	struct i2c_client *client = v4l2_get_subdevdata(subdev);
> >> +	int val;
> >>   	int ret;
> >>   
> >>   	if (!enable) {
> >> +		val = mt9p031_read(client, MT9P031_FRAME_RESTART);
> > 
> > Do you need to read the register ? Can't you write
> > MT9P031_FRAME_PAUSE_RESTART_SET and then MT9P031_FRAME_PAUSE_RESTART_SET
> > | MT9P031_FRAME_RESTART_SET ? And actually, can't we just write both
> > bits in one go, do we need two writes ?
> 
> I think you're right we don't necessarily need to read the registers. The 
> only other bit is not used by the driver.
> 
> But I think we do need two separate writes, at least that is what the 
> datasheet states.
> 
> So I would drop the read but keep both write, ok?

That's fine with me if required, although I don't see where this is
indicated in the datasheet, but I may have missed it.

> >> +
> >> +		/* enable pause restart */
> >> +		val |= MT9P031_FRAME_PAUSE_RESTART_SET;
> >> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +
> >> +		/* enable restart + keep pause restart set */
> >> +		val |= MT9P031_FRAME_RESTART_SET;
> >> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +
> >>   		/* Stop sensor readout */
> >>   		ret = mt9p031_set_output_control(mt9p031,
> >>   						 MT9P031_OUTPUT_CONTROL_CEN, 0);
> >> @@ -505,6 +523,13 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
> >>   	if (ret < 0)
> >>   		return ret;
> >>   
> >> +	val = mt9p031_read(client, MT9P031_FRAME_RESTART);
> >> +	/* disable reset + pause restart */
> >> +	val &= ~MT9P031_FRAME_PAUSE_RESTART_SET;
> > 
> > Same here, I think you can simply write MT9P031_FRAME_PAUSE_RESTART_SET.
> 
> I'll drop the read here as well. But I need to make sure, that the Restart 
> Bit is not cleared manually here.
> 
> >> +	ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >>   	return mt9p031_pll_enable(mt9p031);
> >>   }
> >>   

-- 
Regards,

Laurent Pinchart
