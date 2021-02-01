Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B1330A55F
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 11:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhBAKbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 05:31:34 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37855 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232508AbhBAKb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 05:31:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6WTiluvNKefbk6WTllg8Yh; Mon, 01 Feb 2021 11:30:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612175446; bh=xb9ZQIm5ukpCh4hf5pGxpw8dnV4hrrfQQPyMfamoFcg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QojdJxRymOOoEFcTN9FonKAQMib/wkzBHjVoSvub1TCC7USTKEgpNMg6Z4a8nvYwB
         7EG6k9ZQr1lHAyRrPLSfE7JOud7aSn4gSE0N7vB3EFTBRSUWzf17XVpd4Tp3qQgjJj
         5ectUG2vbDPqqFl7FAM1gOjN+ZRw2qCFvTkBvUmTWQXiwVpm80M96gCiSX72drdMj1
         9fWsdBRDOafjh+U1tq8NCDFn8k029Y9u5H4IGwo51w1b//oF8jO7aNno1N0OSRt3q3
         kWJ8Ze4BabK/9UeYMq8MaUqLG78uzlSnkYEZxxFjy6JhAkuIcvjTto+DkO3tE5c2Q0
         6+eTMI00TFyAA==
Subject: Re: [RFC PATCH resend] vidtv: adapter->mdev was set too late
To:     Daniel Almeida <dwlsalmeida@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
References: <cfe1c825-bb11-ce78-be60-fedb69ef416f@xs4all.nl>
 <69d47520-a2ed-0451-0d66-6192b0b7bc5a@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <69e8bbef-9d21-3605-7b4d-4f4dda4d94dc@xs4all.nl>
Date:   Mon, 1 Feb 2021 11:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <69d47520-a2ed-0451-0d66-6192b0b7bc5a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKhbLco3KN5xlt4zRAEYGqkIhpiu/dI77TcKcncypx9Niy7nwTbU6OiNj+oXKJ/OF7gv5vGpyPRU9UP3UI/MO7jCo3BQSaRVtz4sSnz92JdS/CBFq6YM
 4bjqIA+ARQU/8WE18xKKErE27Exq78n/xE8nJKSCtcjEpLwb675szeP1Wy/BoV33NEKKE1OrcIfizkAYe3QZG4r4PAsAT1bwu1L6fd4KWr78WAG/oA3AOoS4
 AkcQJtZKaKZRIFzy2J+UbY1eOm5hcRNWZFDillOdhUsp4CZYPKlLC4z68zwfdH3w
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/01/2021 13:44, Daniel Almeida wrote:
> Hi Hans (sending this again since it also did not make it to the ML..)
> 
>  > (resend again, looks like the previous two attempts never reached the ML)
>  >
>  > Daniel, how did you test the media controller feature? I don't really
>  > understand how your merged patch for MC support could ever work. It's
>  > the reason I've marked my patch as an RFC since I wonder if something
>  > accidentally got messed up along the way.
>  >
>  > Regards,
>  >
>  > 	Hans
> 
> I still have much to learn on the subsystem.. what I did to test it was 
> trying out this command:
> media-ctl -d platform:vidtv -p
> Media controller API version 5.11.0
> 
> Media device information
> ------------------------
> driver          vidtv
> model           vidtv
> serial
> bus info        platform:vidtv
> hw revision     0x0
> driver version  5.11.0
> 
> 
> I was under the impression that this was enough to show everything was 
> in order with the patch.

It should also show the actual topology, and it doesn't.

With this patch it is now be possible to use 'v4l2-compliance -M platform:vidtv'
to check the media device for compliance.

Note that the vidtv.rst documentation needs some more work:

https://hverkuil.home.xs4all.nl/spec/driver-api/drivers/vidtv.html

1) There is one more reference to 'modprobe dvb_vidtv_bridge', which should be
'modprobe vidtv' (8.2.3.6)

2) 8.1.3.6.1: the dvb-fe-tool output after modprobe vidtv looks slightly different
since [DVBT] is the default delivery system, not [DVBC/ANNEX_A]. The frequency
range output also looks different (likely also because of the different delivery
system). This is confusing, so make sure that the output is in line with what
you see after loading vidtv for the first time.

3) 8.2.3.6.2: we need proper scan files for vidtv that allows us to test the
various delivery systems. They need to be stored somewhere: either as part of
v4l-utils (contrib/test) or in https://git.linuxtv.org/dtv-scan-tables.git/.

4) 8.2.3.6.2: this example is very confusing since it refers to two different
channel files, without showing the contents of either:

$ dvbv5-scan channel.conf
dvbv5-scan ~/vidtv.conf

5) 8.2.3.6.3: this refers to yet another dvb_channel.conf file.

Regards,

	Hans
