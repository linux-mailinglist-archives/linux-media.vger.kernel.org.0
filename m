Return-Path: <linux-media+bounces-34546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF0AD6123
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CE933A1ECB
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 21:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27178242D68;
	Wed, 11 Jun 2025 21:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTSRUEzC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC73C1F;
	Wed, 11 Jun 2025 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676908; cv=none; b=OE8xmeTFr4x0tikpNCdY7dfLKEg5wWzz7jEyXXPbvGYs2kbsFEVc40yW/tHq6WuAabJXQirziICJc5xmfVsaAyyl+SL2QumfG/6bUdAK2d4D0ChcWcgkhZqqPJ9VHW/cA5ZN4jfKXglbLjCVIn50uH/NyYWHdpFHHHKkp+7vC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676908; c=relaxed/simple;
	bh=wSMLjnF4pKnpfzQ8bFRhw7tIJS06byplGjawAcKIzzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKvjRyH1Y+dN84yvKAEZyXpMJ1DbiFVeIVf3MBJFWHSuVwtb9wdhrhUGq9I/uuCz50S58vPZ4/Htbc6EHdzlPUKiw8Ma3ryo7rn3/rE4W1JfKcDFqCR5gpJDy8ar/zLmf2ezxEpP9tgrPbB4cqGJvo3Uhnujp4Y3vIzQVUbWu9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTSRUEzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D853FC4CEE3;
	Wed, 11 Jun 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749676908;
	bh=wSMLjnF4pKnpfzQ8bFRhw7tIJS06byplGjawAcKIzzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTSRUEzCXgmDlV3m3QtQT20fJPvNpen1FjCqD4ysMWKuFWjzimOKnySKlHyk5kYzW
	 SeGHos3mjXNnm3D5nAfJBPR+cOnCENdcxTSnsEZ6/6VbI+TfnlITTw4EXqWcJVVfSC
	 nJp6T6ny03ByAes9uo52wHQuP6foUMSXaBcO+4IAnMub0GvisoWLmkm7m/EDHcMSca
	 CAr0wXqUjdmgPh3jYHd6ybotbrjDBrkBM25mrbek3GMo9Y7mixVh8+iF+gV+PQYQBi
	 b93kONbDqb/t09IgDC0qlv4xBpkYMFTwuDP/sZtxvq151C6sRKL/nZYPdAydbSWlSi
	 HuQ4KwqHgasqA==
Date: Wed, 11 Jun 2025 23:21:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
Message-ID: <aEnzZts6acAtg3IX@cassiopeiae>
References: <20250603093130.100159-2-phasta@kernel.org>
 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
 <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>

> On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
> > On 03/06/2025 10:31, Philipp Stanner wrote:
> > What I am not that ecstatic about is only getting the Suggested-by 
> > credit in 1/6. Given it is basically my patch with some cosmetic
> > changes 
> > like the kernel doc and the cancel loop extracted to a helper.
> 
> Sign the patch off and I give you the authorship if you want.

AFAICS, the proposal of having cancel_job() has been a review comment which has
been clarified with a reference patch.

IMO, the fact that after some discussion Philipp decided to go with this
suggestion and implement the suggestion in his patch series does not result in
an obligation for him to hand over authorship of the patch he wrote to the
person who suggested the change in the context of the code review.

Anyways, it seems that Philipp did offer it however, so this seems to be
resolved?

