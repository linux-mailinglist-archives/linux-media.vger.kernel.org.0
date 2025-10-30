Return-Path: <linux-media+bounces-46001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC2C1FAEF
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 12:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B54C4E673E
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07462765EA;
	Thu, 30 Oct 2025 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsRJ/+U1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F232264D5;
	Thu, 30 Oct 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822032; cv=none; b=RK5R5A2GOADN0iawK2KLr4BVgMXdm4jDpfhkT+8V6VdJR5/Bqxvo00CJq/KE8soh5Egmp3DALXN1nbrH3TvTAjGl+jHvpmqFDEO/z2VcG63n/Q9t6HgcyPsEK7VllVUNp7KXv5UtlYtKzXWHACWdjBAkGlbaqVejcDjcakZ7OwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822032; c=relaxed/simple;
	bh=1oZciniMq/1nEPbcRq4nJkzW8DceA+XYQDPnWeVTvnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bThirrYlg1eO7fHQDzXT9HqRWahFnTu1Epjen7kipZVpHeGQ6y4XyI7II8S1Q6eLNzspvctx+Qmd9BKGbuVcdjWuxXGJkWfdHLcrsNhd1jiDJ1MhQja6BV5YhG+odUusTuCt/2+lq+Bd0L0SBJZaPJaq/t19j45b+YRUidNUgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsRJ/+U1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA00C4CEF1;
	Thu, 30 Oct 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822031;
	bh=1oZciniMq/1nEPbcRq4nJkzW8DceA+XYQDPnWeVTvnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PsRJ/+U1Yu8hD3qiqR+jrz7PKA49zpgOUns6JrEUMO02jPYCxChuU5Uzy5+CzJIg/
	 C1a1saG692xeKL/ryF32pdYGDZaXzD9fmOJq81j6pkAnflSOMq586DJp3Seb/2rZ8T
	 52o8zCtF9vYczTBxqSp1EGi6On3n9GhT+b5Vldlpgps9PGUZv6i3sK6IyhtUsHtBb4
	 loA08Y7IG9wY60gyBErJP4ovGuuvZGK2qLcJFsaCVsZW7lIgFrfuyZ9qcLCswppwAa
	 kMW7otLJe+e3v+Q6AmPk6h0gpxu5QjdsGzARlvX1CR2uJwDDjtF8YbkK/0SXApKvU9
	 UDYV6NdzqYozg==
Message-ID: <f613aa01-447a-4380-b83e-d1b9fb5649b9@kernel.org>
Date: Thu, 30 Oct 2025 12:00:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add TODO list (+ small docu change)
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251023143031.149496-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/25 4:30 PM, Philipp Stanner wrote:
> drm_sched has so many problems that we should have our own TODO list for
> contributors who might wanna help.

Looks good,

Acked-by: Danilo Krummrich <dakr@kernel.org>
>  drivers/gpu/drm/scheduler/TODO | 51 ++++++++++++++++++++++++++++++++++

I'd move this into Documentation/, just like we did it for Nova [1].

[1] https://docs.kernel.org/gpu/nova/core/todo.html

