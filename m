Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3292F14EE7A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 15:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgAaOaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 09:30:00 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45115 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729070AbgAaOaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 09:30:00 -0500
Received: from [IPv6:2001:420:44c1:2577:a04f:7995:3c9:b968]
 ([IPv6:2001:420:44c1:2577:a04f:7995:3c9:b968])
        by smtp-cloud7.xs4all.net with ESMTPA
        id xXIviyHzaVuxOxXIyiw9vz; Fri, 31 Jan 2020 15:29:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580480997; bh=KR7EznYBMkt354xhu7C0+6DgiIJTm+VmPaNCZY9hKD8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ug0sxkYChv6BTu1xkP0sC0xCUcrgwta+q9ucrbSgk0PrmR+LfKQE0mmNl+3GAczVV
         pthR10z9nEwxw8Ai29INnVY+6nf+7Wx524SPlil7t9JaPJ1U/FDJQDcmZEmbS1kRcp
         EkTXRXCn61e2ATxi643jb805dj/imUgzPdfhkeMIxiwHoXvwiKPj2sLPjN1leQLKQS
         Xh/4hHrOD8bNDhJ2RJogp5VR2vS5pn7d1Yuo3xAQyCcoVhH1rTR/akRAx4xTY0QNCq
         b3F3SiietFgU/WkFKmI/IZHdz2BXIRsnLtpLKoOFFwI+YjkQawucLlBK/+G8Y0eFcj
         OdjFizMdjMGWg==
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
 <20200130154246.GA2904678@ulmo>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
Date:   Fri, 31 Jan 2020 15:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130154246.GA2904678@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCqH4Rqa5JScrU5yccR0hxnJW9qBhh+i+yk9NqKcTkbucS1a1ztOTwwyQU2g42qAcwbOjCwjsnGgGdArXN8npjWWmuGBZNbmQhFoft5Za35hhLgqZXVg
 I9gd/W0c7H4ZfjoTL54sEB5r0Ft/X2Vzi0Ql75hrGg6PiK6D2cAxhcky2SEluJk0sK91n2G4vyMPX3E+Zuiz3jTpD+4jfPzqAB5mzYpYYLZW4HOhcOrvM8lj
 XZZyg4mYXik+rnJLRxX0MOIH1QNMpMOHofoD8vaDtHBqKEIeZYlvLoUwBCn4g3DVTYtFjjSq/3OmCJcmfwd2PUNk1EOxPZUWCVNvisiC6RAnv8XKRoEPJuj2
 3LUPN6jfwo8NZMZDfV+/PmkguyFpwbfjj9QnVwCo0jFdX94ryOWetxrmZQYqM3O2H0YwkRuscB3GquDEubL7I5RA9azASuHmbo5QGaJ/jXV+Uc9sHquRj9+7
 DrP5Th9LSmkp7iF7TXVvO8KR8shvQPfraBnlI67rO38aEFbhBENqkJr02MQqpWkvwxA45WUa7AtIXz9jmiSN7tu7dhHJ/vCIHeXwotOIDUtfUPJmi2jn/MC4
 U/Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/30/20 4:42 PM, Thierry Reding wrote:
> On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>>>
>>> [v0]:	Includes,
>>> 	- Adds CSI TPG clock to Tegra210 clock driver
>>> 	- Host1x video driver with VI and CSI clients.
>>> 	- Support for Tegra210 only.
>>> 	- VI CSI TPG support with hard media links in driver.
>>> 	- Video formats supported by Tegra210 VI
>>> 	- CSI TPG supported video formats
>>
>> I'm trying to compile this patch series using the media_tree master
>> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>>
>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_queue_setup’:
>> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variable ‘count’ [-Wunused-variable]
>>    71 |  unsigned int count = *nbuffers;
>>       |               ^~~~~
>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_init’:
>> drivers/staging/media/tegra/tegra-channel.c:518:55: error: ‘struct host1x_client’ has no member named ‘host’
>>   518 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>       |                                                       ^
>> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/tegra-channel.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_tpg_graph_init’:
>> drivers/staging/media/tegra/tegra-vi.c:157:55: error: ‘struct host1x_client’ has no member named ‘host’
>>   157 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>       |                                                       ^
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_init’:
>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_init’:
>> drivers/staging/media/tegra/tegra-vi.c:213:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   213 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-csi.c:259:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   259 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_exit’:
>> drivers/staging/media/tegra/tegra-vi.c:246:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   246 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_exit’:
>> drivers/staging/media/tegra/tegra-csi.c:286:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   286 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>>
>> And indeed, struct host1x_client as defined in include/linux/host1x.h doesn't
>> have a 'host' field.
>>
>> Does this series depend on another patch that's not yet in mainline?
> 
> Sowjanya's been working on top of linux-next, so, yes, this patch
> depends on a change that's been merged into the DRM tree for v5.6-rc1.
> 
> Thierry
> 

Is there a specific linux-next tag that works? I tried next-20200131 but that
failed to boot. Same problem with the mainline repo since the host1x patches
were merged yesterday. It compiles fine, but the boot just stops. Or am I
missing some kernel config that is now important to have?

Regards,

	Hans
