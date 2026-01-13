Return-Path: <linux-media+bounces-50531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD168D17961
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE4063011FB8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD5A38170C;
	Tue, 13 Jan 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsWhm9Dm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC35369213;
	Tue, 13 Jan 2026 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295972; cv=none; b=Y9ZSzphLNTLIVfXaWKwbIFHK/O6pSFV5rpTCBiXTbfameLkI9aZ3aymB0nV5Ksg+AQazaUASewJmjv0CJ5NadnnB+6GQhWQeY07KXgGXYubua0onI2nD5I0ZRpE3OY+auYkRGcBiE5uA/5A+DoDXlhEhDHHmNGbf6dt6Cu3gT40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295972; c=relaxed/simple;
	bh=pMp/vP+6V6CNi+Sf5/eXNH8L5FL9MmyBessBv3fX9cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pfpY3b4UUPLYQeAm0GKzm86R7iD71qT5jvgJH/d+GLF3pEU7jiqUJ6r9MzSTAGAQv2+7I2Iy4UWEBCIqc3tD5hPKsfZkv/V7Zk6cRfn9QwykkshGMTs80UfJPCdBOoYPskkQQlyl0YciU23yhDHH1QL2Bqgkvfpn5Vu+pyC+GUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsWhm9Dm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEC6C116C6;
	Tue, 13 Jan 2026 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768295969;
	bh=pMp/vP+6V6CNi+Sf5/eXNH8L5FL9MmyBessBv3fX9cc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jsWhm9DmJyHuxMjWm1c98DoMzIEce03ZWxKflnlWpdEKNrup2MBJ5RStk6QXFT0zl
	 uIvcuQHhcdsndorBJ7t6YqGkHg5Ex75N8CyMljEHNA2BCxdTC4fUetEfog+qFYgojw
	 ekhL+RHQ2H/oqFinbRBmCRMBrzMj0ExA9s4vHBMUGK9lq5iclKHrRrvNkBxiJVj2Gi
	 EPy3ZRjt+cg7xs9eSSH1EGzQLzbsGEQKRlhSv3tewOuo7gaXU5hSA70XoU/4f/14e1
	 dlZV+0bIKEFpAdZMA9U0pBwdNWm/7PGzJHunjCmWF/oZ8Dy+7iQBTqJmpeYfYiIdKl
	 zVvil8oVut7YA==
Message-ID: <e9098813-3b5a-47a1-b1a8-192040093541@kernel.org>
Date: Tue, 13 Jan 2026 10:19:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL] Linux Media vimc update for 6.20-rc1
To: Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Pavan Bobba <opensource206@gmail.com>,
 shuah <shuah@kernel.org>
References: <5e808887-c849-4ccd-8fbf-77d12e3d8730@linuxfoundation.org>
Content-Language: en-US, nl
In-Reply-To: <5e808887-c849-4ccd-8fbf-77d12e3d8730@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shuah, Pavan,

On 08/01/2026 22:42, Shuah Khan wrote:
> Hi Mauro,
> 
> Please pull the vimc next update for Linux 6.20-rc1.
> 
> Adds
>      RGB/YUV input entity implementation
>      support for V4L2_FIELD_ALTERNATE in vimc-sensor
>      support for multiple RGB formats in vimc-debayer
>      support custom bytesperline values in vimc-capture
>      document RGB/YUV input entity
> 
> diff is attached.

Unfortunately these vimc changes cause regressions in the vimc test-media test.

This test is run in our CI to catch regressions, so it must always pass.

The test is in the v4l-utils git repository (https://git.linuxtv.org/v4l-utils.git/)
in the contrib/test directory. It's run as: 'sudo ./test-media vimc'.

It could be that these changes require changes in the vimc test itself.
In that case I need a patch for test-media fixing this. However, looking
at the failures I think that at least some of the issues are caused by these
patches.

Since this series adds a new entity, I think that test-media needs to be patched
anyway with a new test that tests this new entity as well.

Running the test-media vimc test results in:

Summary:

Total for vimc device /dev/media4: 8, Succeeded: 8, Failed: 0, Warnings: 0
Total for vimc device /dev/video13: 60, Succeeded: 49, Failed: 11, Warnings: 0
Total for vimc device /dev/video14: 60, Succeeded: 60, Failed: 0, Warnings: 0
Total for vimc device /dev/video15: 60, Succeeded: 49, Failed: 11, Warnings: 0
Total for vimc device /dev/v4l-subdev0: 54, Succeeded: 54, Failed: 0, Warnings: 0
Total for vimc device /dev/v4l-subdev1: 54, Succeeded: 54, Failed: 0, Warnings: 0
Total for vimc device /dev/v4l-subdev2: 61, Succeeded: 59, Failed: 2, Warnings: 0
Total for vimc device /dev/v4l-subdev3: 61, Succeeded: 59, Failed: 2, Warnings: 0
Total for vimc device /dev/v4l-subdev4: 54, Succeeded: 52, Failed: 2, Warnings: 0
Total for vimc device /dev/v4l-subdev5: 61, Succeeded: 61, Failed: 0, Warnings: 0
Total for vimc device /dev/v4l-subdev6: 47, Succeeded: 47, Failed: 0, Warnings: 0
Total for vimc device /dev/v4l-subdev7: 47, Succeeded: 47, Failed: 0, Warnings: 0
Grand Total for vimc device /dev/media4: 627, Succeeded: 599, Failed: 28, Warnings: 0

So I'm dropping this PR.

Regards,

	Hans

> 
> thanks,
> -- Shuah
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux tags/linux-vimc-6.20-rc1
> 
> for you to fetch changes up to c3a017646b770b76f0f08c96aa74fbc4404ef674:
> 
>    docs: media: vimc: document RGB/YUV input entity (2025-12-15 12:43:25 -0700)
> 
> ----------------------------------------------------------------
> linux-vimc-6.20-rc1
> 
> Adds
>      RGB/YUV input entity implementation
>      support for V4L2_FIELD_ALTERNATE in vimc-sensor
>      support for multiple RGB formats in vimc-debayer
>      support custom bytesperline values in vimc-capture
>      document RGB/YUV input entity
> 
> ----------------------------------------------------------------
> Pavan Bobba (5):
>        media: vimc: add RGB/YUV input entity implementation
>        media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
>        media: vimc: debayer: add support for multiple RGB formats
>        media: vimc: capture: support custom bytesperline values
>        docs: media: vimc: document RGB/YUV input entity
> 
>   Documentation/admin-guide/media/vimc.rst       |  39 +++--
>   drivers/media/test-drivers/vimc/Makefile       |   3 +-
>   drivers/media/test-drivers/vimc/vimc-capture.c |  15 +-
>   drivers/media/test-drivers/vimc/vimc-common.h  |   1 +
>   drivers/media/test-drivers/vimc/vimc-core.c    |   3 +-
>   drivers/media/test-drivers/vimc/vimc-debayer.c | 113 ++++++++++---
>   drivers/media/test-drivers/vimc/vimc-input.c   | 210 +++++++++++++++++++++++++
>   drivers/media/test-drivers/vimc/vimc-sensor.c  |   9 +-
>   8 files changed, 352 insertions(+), 41 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
> 
> ----------------------------------------------------------------


