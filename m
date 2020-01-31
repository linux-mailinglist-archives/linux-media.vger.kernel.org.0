Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBD314F161
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 18:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgAaRhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 12:37:17 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42169 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726759AbgAaRhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 12:37:17 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xaEAiEmm5n7E5xaEDiorbF; Fri, 31 Jan 2020 18:37:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580492234; bh=3WQbJddM8Wz+twSqqvze0oENBZRmCkzWSKCDCsxgq4M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BhOwnxf2oL/bWm9aFheqdw1CDkYwNjDOcxg/8z+mIyU9sViTJYPkGQm11V67+MPop
         XGEGAyzpQbIRFYjmFehrEYal0CzM185zCo62SJTPrGpHxsJbD8uBHU0wjo1aJW+rWq
         yhj5LGbXR7FfyPFE7tUvbjHlZpglaIOsJLTrBYDsL3uq5QjvjtJQMMwWczpRrV7qDF
         GsjwP/+XYePAnzHEIB1tN/hGghoZsaGAZdG/Qc7edA6B8l09HYE+Gd4fLagqezZ6/4
         FBrA6jrE6oDs9ISLasEKLH6PF8pUnE+WtgUgsdW/0j/hzc9A1b00/jP6AHvHD6tTo7
         0RAVGSmLjKIJA==
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
 <20200130154246.GA2904678@ulmo>
 <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
 <20200131170351.GA3444092@ulmo>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <173dfa3f-a87f-c5dd-1966-558d6edafc3d@xs4all.nl>
Date:   Fri, 31 Jan 2020 18:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200131170351.GA3444092@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfICY9nU5Aw2e/pUvfHfElLJ918rnjLBM2YDNSd7fIVE/4KrbiXVew3jVnrQW4C5m90MLS3pRlNxls2f4W5G+gdhKQZqjo+ux09hp+lHVwOq/XDg/jHXt
 9J1ltt/YHaXxedhW9o5kXFYiLz57dLi71ZnofgkQFE6gffc+RGEj3xia6StUAMSKGW6IdF6UmpOJ0tPQU9e7cx2Xdg0RFZGKyhyrMp5Z1T777IzSRWGn54dP
 peSrTk6Uwx4wUm/3VFbo68UV/VqyHxQ6b2UkMBrH/7didpbNi7uWkUU9qDCU0srX5rcauMRip5VBlnFI/d+pK9KNesMLUHuyAzR/+2C1nyS3g6QLMOrpqSUy
 Gbn1Hk9hEaD8rjiHE9eTjOVa7OvSVpKDDuoIDlIQortq3fUmooNEf2e/laH03xEHhSHp+PuRayIwfSZwdi7ptC/8AvDG6CPzJotBYvkF9OIhgQkK0kuO2zh1
 NKp6GKBoQRKZUWx7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/31/20 6:03 PM, Thierry Reding wrote:
> On Fri, Jan 31, 2020 at 03:29:52PM +0100, Hans Verkuil wrote:
>> On 1/30/20 4:42 PM, Thierry Reding wrote:
>>> On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
>>>> Hi Sowjanya,
>>>>
>>>> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>>>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>>>> generator (TPG) capture.
>>>>>
>>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>>>
>>>>> This series has TPG support only where it creates hard media links
>>>>> between CSI subdevice and VI video device without device graphs.
>>>>>
>>>>> v4l2-compliance results are available below the patch diff.
>>>>>
>>>>> [v0]:	Includes,
>>>>> 	- Adds CSI TPG clock to Tegra210 clock driver
>>>>> 	- Host1x video driver with VI and CSI clients.
>>>>> 	- Support for Tegra210 only.
>>>>> 	- VI CSI TPG support with hard media links in driver.
>>>>> 	- Video formats supported by Tegra210 VI
>>>>> 	- CSI TPG supported video formats
>>>>
>>>> I'm trying to compile this patch series using the media_tree master
>>>> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>>>>
>>>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_queue_setup’:
>>>> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variable ‘count’ [-Wunused-variable]
>>>>    71 |  unsigned int count = *nbuffers;
>>>>       |               ^~~~~
>>>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_init’:
>>>> drivers/staging/media/tegra/tegra-channel.c:518:55: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   518 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>>>       |                                                       ^
>>>> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/tegra-channel.o] Error 1
>>>> make[4]: *** Waiting for unfinished jobs....
>>>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_tpg_graph_init’:
>>>> drivers/staging/media/tegra/tegra-vi.c:157:55: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   157 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>>>       |                                                       ^
>>>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_init’:
>>>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_init’:
>>>> drivers/staging/media/tegra/tegra-vi.c:213:51: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   213 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>>>       |                                                   ^~
>>>> drivers/staging/media/tegra/tegra-csi.c:259:51: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   259 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>>>       |                                                   ^~
>>>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_exit’:
>>>> drivers/staging/media/tegra/tegra-vi.c:246:51: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   246 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>>>       |                                                   ^~
>>>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_exit’:
>>>> drivers/staging/media/tegra/tegra-csi.c:286:51: error: ‘struct host1x_client’ has no member named ‘host’
>>>>   286 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>>>       |                                                   ^~
>>>>
>>>> And indeed, struct host1x_client as defined in include/linux/host1x.h doesn't
>>>> have a 'host' field.
>>>>
>>>> Does this series depend on another patch that's not yet in mainline?
>>>
>>> Sowjanya's been working on top of linux-next, so, yes, this patch
>>> depends on a change that's been merged into the DRM tree for v5.6-rc1.
>>>
>>> Thierry
>>>
>>
>> Is there a specific linux-next tag that works? I tried next-20200131 but that
>> failed to boot. Same problem with the mainline repo since the host1x patches
>> were merged yesterday. It compiles fine, but the boot just stops. Or am I
>> missing some kernel config that is now important to have?
> 
> linux-next and mainline are currently regressing on Tegra210 (and some
> Tegra124) boards. I just sent out a series that fixes the regression for
> me:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=156215
> 
> Please test if this works for you. If so, I'll send this to Dave as soon
> as possible.

I'll try it on Tuesday as I don't have access to the Jetson TX1 until then. It
looks promising since I think that the last message I saw was a PM message.

Regards,

	Hans
