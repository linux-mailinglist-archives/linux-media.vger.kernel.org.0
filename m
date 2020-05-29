Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106BD1E7C81
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgE2MBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 08:01:17 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48959 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbgE2MBQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 08:01:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id edhGjcgpjdPgTedhJjDXFM; Fri, 29 May 2020 14:01:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590753674; bh=ZO+Ovlnua++hBFv9+UDMBx46AxdYoQ+jNl/2tbUseB4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=usAGhpVos51u7CqOpVa+RE79Fhd8k/XX42QtDi3Wwx9L4kaI/MaJ5NxmFjJPXzUuv
         T0yf6f1dVNYykqhpoHFQIpkHQXwI1mZ6mtkT5F0SadRipcXbEbW1OrDvLpj9d4Vu8B
         0snD8xTvlM0DgY/XQaTTlTXY4rpdoKlbc0YIUNnRiok9IyJJUjMb3FwV53+TCLuhaj
         x0H+SC8oo6ip5XTuffY662u5/MaIWrQAqbA9By73sJQ2gKnbyzfzWuWfNI75CMuu+M
         MBvKFioufaSgshGXuthqaMXVey8cRB5hbOfqCErLhKflB1AQPzA8KsJOAFbzWaqWVg
         96YhmC35rQy2w==
Subject: Re: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200529030012.254592-1-jnchase@google.com>
 <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
 <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
Date:   Fri, 29 May 2020 14:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA4WEQQaSpTxqoVzO5MrZE8ZXaWtwLVL1BTv23YT389yYkODRh7A1sdvdfn6PAwLOOHjcRbPbwug3QRxbwRdpu2FNp3zPadZAZ8Jq18pcMhzTB4iMzXR
 SizGCUBSSRSeyxXb1aNx4fRMUbbnuG0S3MRq6FYlKp7X8qgOlHB3Ln+vxD8vImxkt5hEmZMeqn22FSskRZvcb3UhTWwTyM2XwGcHTJ2Pg6rw7msvuSsu1hpF
 1jJDUSlwUR2r+qx1xFmLqtDG7XXJkD92/2SYGgWBbI5bscKzcCIWhc8wlK49eq/dosNl0wUopxr3A0qXObbQ1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/05/2020 08:10, Jeff Chase wrote:
> (Resending as plain text, sorry)
> 
>> +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
>> +{
>> +       struct ch7322 *ch7322 = cec_get_drvdata(adap);
>> +       int ret;
>> +
>> +       if (enable)
>> +               ret = ch7322_unmask_interrupt(ch7322);
>> +       else
>> +               ret = ch7322_mask_interrupt(ch7322);
>> +
>> +       return ret;
>> +}
>> +
> 
> I just realized that doing this here is broken -- the driver depends
> on the interrupt to detect when the physical address changes. I could
> mask only the tx/rx interrupt here instead but that is starting to
> feel a bit pointless.

Ah, OK. Just drop this then.

> 
> I haven't looked into the cec notifier mechanism yet but would it be
> better to try to use that instead if possible and just ignore this
> device's physical address detection? Then I could do more of a proper
> reset in this enable op. But I'm not sure if I can properly associate
> the device with an HDMI port on my platform unless I make some changes
> to coreboot.

I don't think this is useful: it's nice to have the CEC adapter do the
physical address detection.

One question about that though: if there is no physical address, can this
driver still transmit CEC messages? Specifically Image View On. This is
important to wake up displays that pull down the HPD when in standby.

The easiest way to test this is with a Pulse-Eight CEC adapter.

See also the section "CEC Without HPD" here:

https://hverkuil.home.xs4all.nl/cec-status.txt

Regards,

	Hans
