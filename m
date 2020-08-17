Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D5D246764
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 15:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgHQNeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 09:34:08 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56361 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728445AbgHQNeD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 09:34:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7fGykMnG6uuXO7fGzkXMR9; Mon, 17 Aug 2020 15:34:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597671241; bh=wNCyWvw9nVrab0Sl60HGbf6vyqMsaKlzNFFee/jZ8/4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VlTGvIKXXhxEXE2LyLVgZbJak1jiEjSP+Ks26CoNcS4KmbC5xaNpPd2hwojgoFgai
         DxBXLulYLRc+i0C6JExS4ww+YyTls9h14kYdn2Qt/0+gU5M1PyLWsoiBqnAnK40Ho4
         zFOCQ1OXa+Uo4kAqbG8Iaj5mOViqynK7LgjwDCvLQEQ98LHc8gEyRVXR1xTCjEktpe
         eOTPQzWk4odNQ1R/wNcR0W9H521CQvfCYLINS7GobUdV5MwcOee2Y/3anvNXLLpnzM
         RiiCvkfcIPpR7zKZEQkimfcpMBjM62hNbowLm+aQ+NUdONiEyHcarpm7x9cGNCytki
         UWJ39ezNd/1JA==
Subject: Re: Enforcing color profile
To:     Stefan Witzel <s.witzel@gmx.de>, linux-media@vger.kernel.org
References: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
Date:   Mon, 17 Aug 2020 15:34:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLec6vrCCyZigv9bJsEHqoCzvDWooWb159fnCGSStAhjqnIBbWFqqB2xD5xOT5TCW2RhWSLGRHqo1MzSJEakuigB0L2bMcn/RNJY3UduvOjhBwyUjA4/
 T80LwHi3MIE4pmsjV8M3kv3YYPkcF8YnqoY0aC9dcHKXQWWM5D6uBLXWJFi17E1hMQ3e2nGhZTJhGqWfl4A3hlFc6yVI7Ae6dtplCUTra3DeKA3XHlQoE0qK
 rnEpumc3K5c+p+yHmQrCWq+8PDytb93hEMzvxh/W8YZvia8wlmVPSFpgoVmiHanT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/08/2020 14:09, Stefan Witzel wrote:
> Hello,
> 
> I am not a V4L developer so if this is not the right place to bring up
> the issue please tell me who to contact instead.
> The page [1] documents a problem with a particular device "Elgato Cam
> Link 4K" which provides various format options among which most software
> does not consciously pick the one which it implicitly expects leading to
> problems. There is a software workaround, transcoding and looping
> through a virtual device and a hardware fix flashing the problematic
> profiles away.
> However it appears to me that the most satisfactory solution is hinted
> at in the sentence
> 
>> I couldn't find any option in V4L to force selection of 'YUYV 4:2:2', so instead
> 
> So my question is: what changes would be necessary to allow v4l2-ctl to
> enforce a particular format and who would be the right person to ask to
> make such changes?

It's there already:

v4l2-ctl -v pixelformat=YUYV

That will do the trick.

If you plug in the device and run 'v4l2-ctl -V', which pixelformat does it
report? I would expect it to be YUYV since that's first in the list.

If apps like Discord pick YU12 instead, then that's weird. That's something that
the application does, and v4l2-ctl won't help with that. I.e., it appears to be
an application bug.

One other alternative is that the device has broken 4:2:0 support, i.e. it reports
these formats, but they don't actually work. You can use qv4l2 or qvidcap to test
if these 4:2:0 formats are working.

Regards,

	Hans


> 
> Best regards,
> Stefan
> 
> 
> [1] https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
> 

