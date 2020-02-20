Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45ADD165EE3
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 14:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgBTNdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 08:33:54 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35771 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728051AbgBTNdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 08:33:53 -0500
Received: from [IPv6:2001:420:44c1:2577:ac15:94e:5ea0:8199]
 ([IPv6:2001:420:44c1:2577:ac15:94e:5ea0:8199])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4lxbjYOH4jmHT4lxejJjq8; Thu, 20 Feb 2020 14:33:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582205631; bh=W5ASoqeOAh17Qps81aLKTtl0jMkVCmNhhVWeB98kIlg=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VQiME1kharihSlvLOG/fRjPvR5bBNO2M9q/euOR+rf8Xi5ZdL6Ob5tvwHCv/CX0wH
         FvoeGv4APr2WlyboDCvvqBhsOzz2gjJkhUMwIR7VC9imGsFLeobf5wWAaV3RjQdYRc
         8S4c3ihDqmz8tE/UWmAAMgkJeXhm7q/Rvcm4GTGLTCI0BaV8hqpjBtBOo2bzV8DLp2
         X0frPcCFsjpYE36xE/fMBOUMoXBqbRR3/Lp2uLuCDTVqYc71VRU4IRbEI7ypbVmNZG
         41xcH45Kp4Z4MHRX2CFpbwZK33STOtqLjSU9s8mfMsMZ5bwGbtodUyurOzNrxGEpJW
         5l/gGtYyHwOmA==
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
Message-ID: <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
Date:   Thu, 20 Feb 2020 14:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIgbYI0jRMjFLIONkK7nMG/If2b+W2ijCTNCxtI5OT0b9Eo+Ml//odnii0LSDRn39gUvWvWon0ewb/nWgysr/BO9vTlDJPK4JXbfCSlwVVTfOtjdsYfW
 m9giEi3+XdgysUXMIC9ajCfu9dgDEgvrRgjR1VvOFG3k4e19UEIkcuuZIW5Lh68eAFOpKZO8g0kooxbhkAF6qqIqkQp/Twf5BycKYvWJ7ohThBbKlvJZ7kOH
 JdS6ByS8WPWZfHwQjbyrPeP/B5tFhZtXOUaB0dH6xXSPCgngNRnWoIX3Wus+/UYR3qVtR1HDkKyahdq4bmMwH6L/4Cy7QjH8NTJ5AwWAx8SOzKVfgLwar1Rc
 TWRd56Srn8dLbwuWENLRgcriaZ9Ty9oT78bsYUFd93F7P2WAY65VGQyy9NAuul+U1SfN9wHytaU2UWKAz4VwYggCZi0Ex4uUKZfZSgE/eA6L+DB3rXbft12Z
 c1BGU0ckKhnCPe+/59It5KQ4toYMh9nXXmJDZsr0yFSdurZOVD0pxBx69bqZEyUoeQdBCujRssygWu2A7Iq0jnyUu7C+QbKVrJGPAPogcL1tEylb1uKGfhNZ
 7BqVPh9twuBWOw7g2L0GlFZvWqaaJSjIrm2u29klYLjUlmMn2WUNrEI030FNyiGOh2c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Replying to myself so I can explain this a bit more)

On 2/20/20 1:44 PM, Hans Verkuil wrote:
>> +
>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>> +{
>> +	struct device_node *node = csi->dev->of_node;
>> +	unsigned int port_num;
>> +	int ret;
>> +	struct tegra_csi_channel *item;
>> +	unsigned int tpg_channels = csi->soc->csi_max_channels;
>> +
>> +	/* allocate CSI channel for each CSI x2 ports */
>> +	for (port_num = 0; port_num < tpg_channels; port_num++) {
>> +		item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
> 
> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
> all memory allocated with devm_ is immediately freed. But if an application
> still has a filehandle open, then when it closes it it might still reference
> this already-freed memory.
> 
> I recommend that you avoid using devm_*alloc for media drivers.

A good test is to unbind & bind the driver:

cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
echo -n 54080000.vi >unbind
echo -n 54080000.vi >bind

First just do this without the driver being used. That already
gives me 'list_del corruption' kernel messages (list debugging
is turned on in my kernel).

Note that this first test is basically identical to a rmmod/modprobe
of the driver. But when I compiled the driver as a module it didn't
create any video device nodes! Nor did I see any errors in the kernel
log. I didn't pursue this, and perhaps I did something wrong, but it's
worth taking a look at.

The next step would be to have a video node open with:

v4l2-ctl --sleep 10

then while it is sleeping unbind the driver and see what happens
when v4l2-ctl exits.

Worst case is when you are streaming:

v4l2-ctl --stream-mmap

and then unbind.

In general, the best way to get this to work correctly is:

1) don't use devm_*alloc
2) set the release callback of struct v4l2_device and do all freeing there.
3) in the platform remove() callback you call media_device_unregister()
   and video_unregister_device().

It's worth getting this right in this early stage, rather than fixing it
in the future.

Regards,

	Hans
