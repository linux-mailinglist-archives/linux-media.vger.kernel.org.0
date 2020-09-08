Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B47260DDF
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgIHIqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:46:19 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50193 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729775AbgIHIqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:46:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FZGZkWOeiMeQuFZGakfFvl; Tue, 08 Sep 2020 10:46:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599554777; bh=5BjAMOh18xMR8dQHvVUmpyip0di5JV2lMHop3B89Bx8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TudaNhNJecwawGyZCFChCM8XXDrmi7CYkuZmjM0PJNWLFxFrW3TMsMvUQSH9HPaSi
         EGTWiQ40apkflopYxn9TWIXipANgVEmoEcEoiuoUj09fSl+HbfLARC05VVFUutB/j3
         GqZGVCsdsn1YoCkWd6LNpJWn0jsTB9n2pXBC7lNfTEjsAT8qC4kgtFyIARdStpvfCk
         FsdtGoD+7gJveFiu18Gk9aoXaTRRogE+RrFKSkHomkXmhO/LGt5agg9aI3K0F0eyvD
         d5llwVdY01LIxHZAjP7Q5dV05J6543jfGsBG0wwnqAMOUT7UIVNt+40ANRIkbiB1x6
         rL3LbonWzto9A==
Subject: Re: Asus PN50 CEC
To:     Timo Ketola <timo@riihineva.no-ip.org>, linux-media@vger.kernel.org
References: <e56fb2cd-5e40-b83e-f702-0dced9df86fb@riihineva.no-ip.org>
 <8634e5af-175d-1fff-1693-1445f336b9f9@xs4all.nl>
 <d2d11658-7e06-986f-36dd-1321abc2baee@riihineva.no-ip.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0a8ee8ec-b77d-9f28-f386-ac910bc16dcd@xs4all.nl>
Date:   Tue, 8 Sep 2020 10:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d2d11658-7e06-986f-36dd-1321abc2baee@riihineva.no-ip.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMT7FygA348k212I+O4Tyj2UXb/Q93UPvb6XjsMUxtRDB5PbRzDutkB0FkfK8On6drREkEAmxvepbUygF+5UWMkq0ZFfcWyL0r2FLeGDVBlx4Ol1/r5g
 OooN3mcP8xzVl2kHFvJWmTfE/+G4ee/UuiBqzKaB1+L20FGHypgjLh+GKDH7i6MVtfKa+pTD+4+gaHOkOkSDwECMot/vxez5zxhDZVQ65j7OBT/SqF/lKFHa
 egJSAtmljMWlDFQCosRWOu2jvJ9ifUF5IW65wU4nMOD3qeWBGnnPMELruppFMR0NSgaM/i5gQBSrEMbqCcF+xg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/09/2020 10:13, Timo Ketola wrote:
> On 8.9.2020 10.57, Hans Verkuil wrote:
>> I suspect that this is a BIOS-only implementation that just does the bare minimum
>> for wake up and standby (if enabled).
> 
> What does it mean? Is it just that BIOS does not report about it to the OS? If it was implemented with GPIOs, shouldn't it still be possible to write a driver for it - in theory - if we somehow were
> able to find out the GPIOs?

Usually CEC is handled by a microcontroller or a specialized CEC chip.
It's rare to see a pure GPIO implementation.

So it is typically not possible to get access to it if it is all handled in
the BIOS. At least, I've never seen it.

I also suspect that what they call 'CEC' is a really cut-down implementation,
just enough to receive/transmit wake-up and standby messages.

Sadly, without any documentation there isn't anything that can be done about this.

If you want to support CEC under linux, then go with a Pulse-Eight USB CEC adapter:
this is fully supported by linux.

Regards,

	Hans

> 
> Unfortunately, I don't know too much about modern PCs at this level.
> 
> Thanks for looking at this!
> 
> -- 
> 
> Timo

