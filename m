Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0B6F14DCEF
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 15:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgA3Ol5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 09:41:57 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34339 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726902AbgA3Ol5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 09:41:57 -0500
Received: from [IPv6:2001:420:44c1:2577:91db:5aec:4999:a214]
 ([IPv6:2001:420:44c1:2577:91db:5aec:4999:a214])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xB0wi8DaDn7E5xB10ihO2H; Thu, 30 Jan 2020 15:41:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580395314; bh=QnPaP0j7tU+614rpIwXLpxlJdA4DU0xJ3ZxN1G79ADQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r75JM9pRExf82CZ7FTBGlvkFhPkPpCm2DkdDJINO6iJLHjtBlgmFv1Cb74Y4xU1HN
         5j+JSYi9g1tRZeqf/i7OM7IWlauH0nRLUzf4RRH7Ak064pkFjkAETMb9YMWxqNnerj
         Xq8asYxF8w2DfV3MM0LpaztPE65XxDhvBLat//JhmNq3OMXhdCrs9c3CdrhNx7nBZr
         zSnMiyirRNlq6PratqnuLv0kpm1MFxIDyqsrbx03Hppe6Lc60YNP8qriaTUr+vLA3H
         XBun4lMMYIk4G/Of9cUwzOKulAqDHCVd6ArajwBXxWQ8o/LXYZ7UGjDxnSlmtwaptf
         +vsndPF+uLtsg==
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
Date:   Thu, 30 Jan 2020 15:41:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfN+R3ebeiMNb2jJ1P75j291PEX7Nx0Vzuu5rpXhX/cJ38nUz/4cnLiRCfwVJYfJCp/PkuNx0rQWRF/xNAiuZxjbGS1z51MggWPtc4+dtx+wXvGHWJJKu
 cyfZmlbdcWigV2+QEOY+HCeV/V34tI23h763YO8GoG2/NECw0Neg+njWR/4eurtljC2w5qduoYwUDJ4JlT5BCsXEzix3dUiZsqdYgpq15Jr6evsknO11Lc9/
 ZhKgWLbF4iGzuTUG6BqLqGc0F2MlCvBBltw5wI9DSDwcd4m+VQAMibmVIfJrniLo3mRCV+A5Saceg9UlQNa26uTo7q/BVZWJA6WodoTqS/ySvEOfSbjufqUT
 2mG55hSvr7OJbhx1Y4g8iugiAB4nojbnAKFx7eAKAicO8xqLeO+qWiI/Zk4V44ywXScsZdieB2CA92LkRmjnbC/xJPdzqGk+QTUyYuS7U/Sk6ybPJ/TA1pxb
 8MWxU5lkx88SLfdOppp29RZAkVnbvNicF38sw5TAiu5TmtLBp4hl397SG8C1xNC0eUE1J9m7YyMpygeCX04Kv00Ns5mEN7cJLTOIghbfUwZP3hDtVC36H0BW
 znA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> This series adds Tegra210 VI and CSI driver for built-in test pattern
> generator (TPG) capture.
> 
> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> CSI port is one-to-one mapped to VI channel for video capture.
> 
> This series has TPG support only where it creates hard media links
> between CSI subdevice and VI video device without device graphs.
> 
> v4l2-compliance results are available below the patch diff.
> 
> [v0]:	Includes,
> 	- Adds CSI TPG clock to Tegra210 clock driver
> 	- Host1x video driver with VI and CSI clients.
> 	- Support for Tegra210 only.
> 	- VI CSI TPG support with hard media links in driver.
> 	- Video formats supported by Tegra210 VI
> 	- CSI TPG supported video formats

I'm trying to compile this patch series using the media_tree master
branch (https://git.linuxtv.org//media_tree.git), but it fails:

drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_queue_setup’:
drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variable ‘count’ [-Wunused-variable]
   71 |  unsigned int count = *nbuffers;
      |               ^~~~~
drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_init’:
drivers/staging/media/tegra/tegra-channel.c:518:55: error: ‘struct host1x_client’ has no member named ‘host’
  518 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
      |                                                       ^
make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/tegra-channel.o] Error 1
make[4]: *** Waiting for unfinished jobs....
drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_tpg_graph_init’:
drivers/staging/media/tegra/tegra-vi.c:157:55: error: ‘struct host1x_client’ has no member named ‘host’
  157 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
      |                                                       ^
drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_init’:
drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_init’:
drivers/staging/media/tegra/tegra-vi.c:213:51: error: ‘struct host1x_client’ has no member named ‘host’
  213 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
      |                                                   ^~
drivers/staging/media/tegra/tegra-csi.c:259:51: error: ‘struct host1x_client’ has no member named ‘host’
  259 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
      |                                                   ^~
drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_exit’:
drivers/staging/media/tegra/tegra-vi.c:246:51: error: ‘struct host1x_client’ has no member named ‘host’
  246 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
      |                                                   ^~
drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_exit’:
drivers/staging/media/tegra/tegra-csi.c:286:51: error: ‘struct host1x_client’ has no member named ‘host’
  286 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
      |                                                   ^~

And indeed, struct host1x_client as defined in include/linux/host1x.h doesn't
have a 'host' field.

Does this series depend on another patch that's not yet in mainline?

Regards,

	Hans
