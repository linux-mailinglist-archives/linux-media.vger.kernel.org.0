Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0272FD889
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 19:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392027AbhATSe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 13:34:58 -0500
Received: from mout02.posteo.de ([185.67.36.66]:54385 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404745AbhATSb5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 13:31:57 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id A0D1B2400FF
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 19:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1611167455; bh=qvMzQw2TwTYjm8mOxwU+wndNnxZxsfyyI1DDQLE1s6k=;
        h=Date:From:To:Cc:Subject:From;
        b=NjltNuBs3lSNafSzlOAJlnEuW7e16KeC7gTsnmt5DHoAhUHQMZzXuTRmXmT4ZPKWo
         It70qf+BjlnRhRaHVYNSHcovRH6bBNkl1g4jDLWGfqQ75Nx++wKyYk1Q1a+jUw7kwk
         +fdGhEpdAN4bfGQqMRefgExEHd5+y9Sj8O3bHXb2XlB7ZtV4MoIq7Cpc/XHtr2uVfO
         gz/0HyIKU4cd9rNjyHxYJlgaRHRwqvGkpNIpP0YFnsdGug5BqFWr4qrO+d+Ci8x/I7
         s4OurTPNGQdeYmcP9a6pn7pvTDH5pGH4N81++v3A5bnkxKOLxZKWMpkKFredZj893v
         +0hAZlUmPoMVQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DLYxV64bYz6tmH;
        Wed, 20 Jan 2021 19:30:54 +0100 (CET)
Date:   Wed, 20 Jan 2021 19:30:54 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: Failing V4l2-compliance test with a sensor driver
Message-ID: <20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510>
References: <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
 <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
 <20210118071500.x7e2pdszql44ncba@basti-TUXEDO-Book-XA1510>
 <bea28ee9-0cb4-4849-5e73-96e6ef1f945a@xs4all.nl>
 <20210118180306.aai3zfo5xpcr3y32@basti-TUXEDO-Book-XA1510>
 <cb50dc5e-33c6-d002-a31a-af91bbec6d6e@collabora.com>
 <7b77875c-5339-1c90-a6d8-304d56097861@xs4all.nl>
 <20210119191634.nolxxbisfdgm4gj7@basti-TUXEDO-Book-XA1510>
 <06878d92-70c2-ca24-b6c7-032becb0a0f6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <06878d92-70c2-ca24-b6c7-032becb0a0f6@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 20.01.2021 11:16, Hans Verkuil wrote:
>On 19/01/2021 20:16, Sebastian Fricke wrote:
>
><snip>
>
>> I gathered all the information you require within this paste-bin:
>> https://paste.debian.net/1181807/
>
>Hmm, the problem is that v4l2-compliance can't find the media controller
>that the subdev is part of.
>
>What is the output of:
>
>ls -l /sys/class/video4linux/v4l-subdev3
>
>There should be a 'device' link listed.
>
>Please also show the output of:
>
>ls -l /sys/class/video4linux/v4l-subdev3/device/
>
>If I compare this with the vimc test driver (using v4l-subdev0) there is a
>media0 directory in /sys/class/video4linux/v4l-subdev0/device/ which is
>the media controller that the subdev is associated with.

There is no `media0` folder for the ov13850 subdevice :/ I have captured
the output for all of the subdevices as comparision.

https://paste.debian.net/1181951/

>
>Regards,
>
>	Hans

Greetings,
Sebastian
