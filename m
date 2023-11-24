Return-Path: <linux-media+bounces-965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19F7F7010
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 10:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1C71C20F52
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 09:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439D215AFB;
	Fri, 24 Nov 2023 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1215AC3
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 09:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982B0C433C7;
	Fri, 24 Nov 2023 09:38:01 +0000 (UTC)
Message-ID: <4a41ef2f-99d4-4cf2-bf92-a53ec7c34335@xs4all.nl>
Date: Fri, 24 Nov 2023 10:37:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: build scripts: branches with forward slashes in names
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: linux-media@vger.kernel.org
References: <ZV_QuX5YScktbQi3@mz550>
 <67201f49-aacb-48a4-a11c-38a8875440b4@xs4all.nl>
In-Reply-To: <67201f49-aacb-48a4-a11c-38a8875440b4@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2023 08:23, Hans Verkuil wrote:
> On 23/11/2023 23:22, Deborah Brouwer wrote:
>> Hi Hans,
>>
>> Have you ever had a problem running the build scripts on branches with
>> forward slashes in their names?
>>
>> So, for example, I add my repo to env.sh
>> myrepo=https://gitlab.collabora.com/chipsnmedia/kernel
>>
>> I run ./build.sh setup and I can see it fetching my repo and including
>> my branch "dbrouwer/KConfig_fix", but if try to run:
>>
>> ./build.sh -test all dbrouwer/KConfig_fix
>>
>> I get this error:
>>
>> "fatal: 'dbrouwer/KConfig_fix' is not a commit and a branch 'build-test' cannot be created from it"
>>
>> But then if I change the branch name to remove the forward slash "KConfig_fix" it works fine again.
>>
>> Have you noticed anything similar? Could it be easily fixed?
>>
>> Thanks,
>> Deborah
>>
> 
> From the README:
> 
> "If <branch> is absent, then it will default to media_stage/master. If it
> contains a / character, then the branch name will be used as-is (e.g.
> use <remote>/<branch> to build a branch on a specific remote), otherwise
> the branch name will be prefixed by main/ (e.g. main/<branch>), which
> uses the branch on your '$myrepo' repository."
> 
> I never use / in branch names (too confusing with / in pathnames), and since
> I developed these scripts originally for myself, I just grepped for /.
> 
> Perhaps the build script should allow for 0-2 arguments at the end:
> nothing means media_stage/master, 1 arg means main/<branch> and 2 args
> means <remote>/<branch>.
> 
> Let me see what I can do.

I've done exactly that: after the <branch> argument you can now add an
optional <remote> argument. So branch now supports / in the name.

Regards,

	Hans

