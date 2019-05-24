Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C323291A9
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 09:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389147AbfEXHZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 03:25:26 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33579 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388910AbfEXHZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 03:25:26 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id U4ZshHnhOsDWyU4ZwhQhDj; Fri, 24 May 2019 09:25:24 +0200
Subject: Re: [PATCH v6 2/3] drm/bridge: dw-hdmi: pass connector info to the
 CEC adapter
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190517154256.255696-1-darekm@google.com>
 <20190517154256.255696-2-darekm@google.com>
 <8f2ceecd-da9e-a923-da72-cdc660eecb3a@xs4all.nl>
 <CALFZZQHjc8WxuuGzcWUjDJ2TU9Pyp+f0XN0p8iPahPFAOtw6AA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dc7a5a31-ca37-167f-5ebe-9b27e0830a87@xs4all.nl>
Date:   Fri, 24 May 2019 09:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHjc8WxuuGzcWUjDJ2TU9Pyp+f0XN0p8iPahPFAOtw6AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOkeo0nb1UDHfM7/T2Pc2KEcf8pmdZTyE9osaYNAyx1GgUfuywIBwhNcFonPRJLVHp3bl1YzsC/HXuCoKIjQycLgDfJ32muL9mNRLV8menfJUxYckl2n
 TMTBAIVsPRp4TRq71EXKgItmT+biNoX9+5siaKdotHubDo2ypWteJbZwQC2PnxjpPHHCBJtuPyNmjKPiWOpGW1vL1XGUldeEihF4F9GcLN7+c7j0JSLnsqjk
 pwNVpwScyxcPn/CMp4IJFQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/21/19 12:54 PM, Dariusz Marcinkiewicz wrote:
> On Mon, May 20, 2019 at 1:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 5/17/19 5:42 PM, Dariusz Marcinkiewicz wrote:
>>> This patch makes dw-hdmi pass DRM connector info to a respective
>>> CEC adapter. In order to be able to do that it delays creation of
>>> the dw-hdmi-cec platform device until DRM connector is initialized.
>>>
>>> Requires testing.
>>
>> Testing this patch with the Khadas VIM2 board gives this kernel warning:
>>
> Thank you for testing!
> 
> This was probably because the platform device info was not fully
> initialized. Hopefully it is better in v7.

This now works without a crash on my Khadas board!

Thanks,

	Hans
