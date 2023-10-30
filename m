Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EC67DB4DA
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 09:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjJ3IJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 04:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbjJ3IJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 04:09:46 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522E3A2;
        Mon, 30 Oct 2023 01:09:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SJmC85Yftz49Q2C;
        Mon, 30 Oct 2023 10:09:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1698653381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wdLbmNkZHwC81DUonhNviILxZ3gL1acKOh4/pnU2af4=;
        b=mLcmwhtlZFvqDtPgCJML1UNiOlHCZx0EhKnXCYIl/pRM0YG5ybM5fsJ/jaNS5OkEKINBsr
        lTu0XEdaIKLNmgDI8kFPwienoe9dTJ7QMpihx69DZE96yWZbzRFkvNFEVwKgeQHKpQ75SH
        9HY6kqoC2Q05x8G1/FwB5hDabYrT2VZXs9EfJjr/l3t5BT1MuEz6XcGj7ednSQ+jvcz+H2
        BVrHaaraDldrRGzqfL47dUlvIAP0kGhALY5MWvBszibGzEhLs4Y9/eZblfSdcedaAd0wfy
        Yeg79mmM0S+UQbhasfey92aLSt6VKgGdRbymCzzR2g++Xs9YTMDY1FX7PT9RsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1698653381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wdLbmNkZHwC81DUonhNviILxZ3gL1acKOh4/pnU2af4=;
        b=mfE8md0tLwQywuGjZHhpgYXVGDvOITPhwNC3B+CFRYXUNlTDMZ2FQyqvhcj5wTRwbtYMrw
        je1+o5sl1S+84JSy90ILw+qR9wyLivPvN1ACshnnQdbluDzAfmek//eHRQRf5D9MoaVMcJ
        xrDPIum5s/Uwk6S8TPzmApUkW3g2o1PTt99/nKg8J02hzE4KDeNjRF8Yt4T7Z6iJQBUCxO
        MXWtGjdp403+C2GO4VLhRqHq7ipKTbuO79kumKOrV3jF6y9nTIrn8kijzwM01S3XEeGzYw
        kEzateNIF2/WLk3WENC5zy3tPjHwUIaCkt3pRWxuPz14qaKzYQHA7EOga4aYBA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1698653381; a=rsa-sha256;
        cv=none;
        b=suDw42o0yYrTxqgkbFhvrZVZ/Si5OZPQ9cIRSay7Yus7SoGwh47jscQzcZjbM2SUVoOE4D
        KAbbBgOiVNVGEyEyKubogsQdepALsi1GHORI/a49RzN1dX4NYdbDtMYe3YAk6WdHfwnL2P
        lA9DbVorfMHtFflVmfJk9a31g11olWx6zZkiAidQL3PFfxUzsphoaX/fS4tUdFF15GLudI
        eWYzybuctscSDveaSLMX0+qdNElHhONgAEBrqYrDNNLSNn0sRvr+MXroXIj7HtbtjpQhCz
        64yDqX4GfPA9hAQ8F7s2YUJpEG45p1ZNLdc6UBIgDa3k971RQ08TvAQ1OJSmpA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 975F9634C93;
        Mon, 30 Oct 2023 10:09:36 +0200 (EET)
Date:   Mon, 30 Oct 2023 08:09:36 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028151858.GB20465@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Oct 28, 2023 at 06:18:58PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 27, 2023 at 02:50:09PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Fri, Oct 27, 2023 at 03:45:29PM +0300, Laurent Pinchart wrote:
> > 
> > ...
> > 
> > > > > +#include <linux/clk.h>
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/firmware.h>
> > > > > +#include <linux/gpio/consumer.h>
> > > > > +#include <linux/i2c.h>
> > > > > +#include <linux/init.h>
> > > > > +#include <linux/iopoll.h>
> > > > > +#include <linux/kernel.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/mtd/spi-nor.h>
> > > > > +#include <linux/of_device.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > > +#include <linux/slab.h>
> > > > > +#include <linux/thp7312.h>
> > > > 
> > > > uapi/linux/thp7321.h ?
> > > 
> > > Is that needed ?
> > 
> > It's a UAPI header. Wouldn't it be reasonable to include it that way
> > (instead of relying on searching include/uapi as well)?
> 
> There are some occurences of '#include <uapi/' in drivers/ (I counted
> 338), but why is that better ?

I'd presume that at some point the -Iinclude/uapi will be cleaned up and
then the only option remains to include it from there directly. Why not to
do it already now?

> 
> > > > > +	struct {
> > > > > +		struct v4l2_ctrl *noise_reduction_auto;
> > > > > +		struct v4l2_ctrl *noise_reduction_absolute;
> > > > > +	};
> > > > > +
> > > > > +	const char *fw_name;
> > > > > +	u8 *fw_data;
> > > > > +	size_t fw_size;
> > > > > +
> > > > > +	u8 fw_major_version;
> > > > > +	u8 fw_minor_version;
> > > > > +
> > > > > +	/* Lock to protect fw_cancel */
> > > > > +	struct mutex fw_lock;
> > > > > +	struct fw_upload *fwl;
> > > > > +	bool fw_cancel;
> > > > 
> > > > Arranging this right after fw_* would save some memory.
> > > 
> > > After what ? I assume you mean fw_*_version ? It would, but it would
> > > feel a bit out of place. I'll see what I can do.
> > 
> > Yes. There doesn't seem to be any firm ordering here either. Up to you.
> > 
> > ...
> > 
> > > > > +	val = ((conv_lanes[3] & 0x03) << 6) |
> > > > > +	      ((conv_lanes[2] & 0x03) << 4) |
> > > > > +	      ((conv_lanes[1] & 0x03) << 2) |
> > > > > +	       (conv_lanes[0] & 0x03);
> > > > 
> > > > You could construct val in the loop and drop conv_lanes altogether.
> > > > 
> > > > I.e.
> > > > 
> > > > 		val |= (i & 0x03) << ((lanes[i] - 1) * 2);
> > > > 
> > > > And assign val to 0 in declaration.
> > > 
> > > I think I'll compute it at probe time and cache it instead.
> > 
> > If you don't need anything else in the endpoint, you could move it out of
> > the device context struct.
> 
> That's what I've now done, yes.
> 
> > > > > +	for (rate = mode->rates; rate->fps; ++rate, --index) {
> > > > > +		if (!index) {
> > > > > +			fie->interval.numerator = 1;
> > > > > +			fie->interval.denominator = rate->fps;
> > > > 
> > > > Maybe a newline here?
> > > 
> > > If that makes you happy :-)
> > 
> > Newlines are great (when they are at the right places)!
> > 
> > > > > +	case V4L2_CID_THP7312_NOISE_REDUCTION_AUTO:
> > > > > +	case V4L2_CID_THP7312_NOISE_REDUCTION_ABSOLUTE:
> > > > > +		/* Ignore the manually set value if auto has been set */
> > > > > +		value = thp7312->noise_reduction_auto->val
> > > > > +		      ? 0 : 0x80 | (thp7312->noise_reduction_absolute->val & 0x7f);
> > > > 
> > > > "?" should be on the preceding line.
> > > 
> > > Isn't that a matter of coding style preference ?
> > 
> > Yes, indeed, and I recall GNU coding style is shunned upon here. :-)
> > 
> > > > > +
> > > > > +		cci_write(thp7312->regmap, THP7312_REG_NOISE_REDUCTION, value,
> > > > > +			  &ret);
> > > > > +		break;
> > > > > +
> > > > > +	case V4L2_CID_AUTO_WHITE_BALANCE:
> > > > > +		value = ctrl->val ? THP7312_WB_MODE_AUTO : THP7312_WB_MODE_MANUAL;
> > > > 
> > > > I'd do this in the call, up to you.
> > > 
> > > Only if you allow lines longer than 80 columns ;-)
> > 
> > I don't think you need longer lines for that, do you?
> > 
> > > > > +
> > > > > +		cci_write(thp7312->regmap, THP7312_REG_WB_MODE, value, &ret);
> > > > > +		break;
> > > > > +
> > 
> > ...
> > 
> > > > > +static enum fw_upload_err thp7312_fw_write_to_flash(struct thp7312_device *thp7312,
> > > > > +						    u32 dest, u32 write_size)
> > > > > +{
> > > > > +	u8 command[sizeof(thp7312_cmd_write_ram_to_flash) + 6];
> > > > > +	static const u32 cmd_size = sizeof(thp7312_cmd_write_ram_to_flash);
> > > > > +	u64 val;
> > > > > +	int ret;
> > > > > +
> > > > > +	memcpy(command, thp7312_cmd_write_ram_to_flash, cmd_size);
> > > > > +
> > > > > +	command[cmd_size] = (dest & 0xff0000) >> 16;
> > > > > +	command[cmd_size + 1] = (dest & 0x00ff00) >> 8;
> > > > > +	command[cmd_size + 2] = (dest & 0x0000ff);
> > > > > +	command[cmd_size + 3] = ((write_size - 1) & 0xff0000) >> 16;
> > > > > +	command[cmd_size + 4] = ((write_size - 1) & 0x00ff00) >> 8;
> > > > > +	command[cmd_size + 5] = ((write_size - 1) & 0x0000ff);
> > > > > +
> > > > > +	ret = thp7312_write_buf(thp7312, command, sizeof(command));
> > > > > +	if (ret < 0)
> > > > > +		return FW_UPLOAD_ERR_RW_ERROR;
> > > > > +
> > > > > +	usleep_range(8000000, 8100000);
> > > > 
> > > > I guess there's time to make some tea here?
> > > 
> > > For a flash infusion, gong fu style, probably.
> > > 
> > > We don't have much documentation about the exact values of the delays
> > > that are needed, and why :-(
> > 
> > I have even less documentation (none) on this device. Is polling an option,
> > as you're reading a register to verify the operation was successful?
> 
> I'll try to ask and get more information. As firmware update is an
> uncommon and not time-sensitive operation, I'd rather be cautious here
> and not over-optimize.

If this is only done in order to *upgrade* the firmware, it's certainly not
a concern IMO.

> 
> > > > > +
> > > > > +	ret = cci_read(thp7312->regmap, THP7312_REG_FW_VERIFY_RESULT, &val,
> > > > > +		       NULL);
> > > > > +	if (ret < 0)
> > > > > +		return FW_UPLOAD_ERR_RW_ERROR;
> > > > > +
> > > > > +	return val ?  FW_UPLOAD_ERR_HW_ERROR : FW_UPLOAD_ERR_NONE;
> > > > > +}
> > 
> > ...
> > 
> > > > > +	/*
> > > > > +	 * Register a device for the sensor, to support usage of the regulator
> > > > > +	 * API.
> > > > > +	 */
> > > > > +	sensor->dev = kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
> > > > > +	if (!sensor->dev)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	sensor->dev->parent = dev;
> > > > > +	sensor->dev->of_node = of_node_get(sensor->of_node);
> > > > 
> > > > This device could well find its way to a non-OF system. Could you use the
> > > > fwnode property API instead?
> > > 
> > > I'm pretty sure there will be problems if someone was using this driver
> > > on an ACPI-based system, so trying to pretend it's supported without
> > > being able to test it may not be the best use of development time. I'll
> > > try, but if I hit any issue, I'll keep using the OF-specific functions
> > > in the next version.
> > 
> > I'd suggest to use OF functions if there's no corresponding fwnode function
> > available. The intention is they cover the same scope, so it is likely
> > something that's missing will be added sooner or later.
> 
> I understand, but if the conversion is not complete, it's not very
> valuable. I have no objection against using the fwnode API in the
> driver, but I'll let someone else handle it when and if needed.

If you leave it using OF-only API now in a driver that is not bound to OF
in any way, someone moving it to fwnode later may not be able to test it on
OF, increasing the likelihood something breaks. So use fwnode API where you
can now, and we'll address that one call later on.

> 
> > > > > +	/* Retrieve the sensor index from the reg property. */
> > > > > +	ret = of_property_read_u32(node, "reg", &reg);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "'reg' property missing in sensor node\n");
> > > > 
> > > > Shouldn't you assume it's zero instead?
> > > 
> > > The property is mandatory.
> > 
> > You could also make it optional as that appears to be the general practice.
> > Up to you.
> 
> I think it's easier to keep it mandatory.

Ack.

-- 
Regards,

Sakari Ailus
