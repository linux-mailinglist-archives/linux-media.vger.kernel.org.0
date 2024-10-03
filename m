Return-Path: <linux-media+bounces-19051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9F98F045
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 15:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25CAA1C21EC5
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC327186E46;
	Thu,  3 Oct 2024 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="CIeq/0fY"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE541E495
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961742; cv=none; b=D9t4QtBDWATKqKS+QPWuga4bxkukbnqlzNGqUj/9WY31EW7ClfKdeBlfbcdz0/1QhUqxDFy5mVAVrnNEKRt9ivx46NWkCGanRNmTzZ9MpbD7Ok0QyIzAp1Cpl1qhN6D76MNgxLiaMyWhd9YIgEYpxBb1reWB9BnvYQPI4XgOz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961742; c=relaxed/simple;
	bh=nv0FgaFKHGkmjdDLkYiI1AEM3pljg0jH1v+djQn+Zbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k0ZV1TCc5QA7V80Nq2U638s776WqfkNGithI+kmE3ur0GwZk5bcD285R/Qmxe4eZRqWE93OXAJna3Rg08MtKMDB4np6+1/zuPA3Cfh0fNNMMncDFi4IFU7JfqP6XLjKuFnPtCqsw5rSCZGbMz4O3FG+rK20ANhBYPvQMC7tEHQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=CIeq/0fY; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CCD92882EF;
	Thu,  3 Oct 2024 15:22:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727961738;
	bh=uP03EAvbgMFo8FIIGCjODw33bfMHOqdvMTjROtQOjkw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CIeq/0fYYbk99AeqMA+9lAMdogPSXOkihdg46Y4jV89O68NNIvbk84imZcB5QYWRI
	 kFMyqnBS1S/CrnCnUNB5ThKRiW+DMFd2vVn2InMszUgo8EaA0320Yr9VS0yLJqoNLP
	 ZtOm/34ZoziDJO/pliKKvlRa4yKnXuf4MMRy4KuFXLCBUn8yitLsN1ajdo+hnuCX/w
	 gq8mg2q9ZTSKFSddSEJ1HDIT7/o4oHTDrLmry8NiCgso0Q9znN51HHXbe3Ub/PzjDl
	 0wZTdcNWNWJAyhucP3BDztu2enbm2JfKv4FgXgDly+6b+7WWZQQqb0o3KiSChvTJWU
	 EMbBI7Y64Sw3A==
Message-ID: <a12f4cb2-511e-4302-8e66-3ba90e84a228@denx.de>
Date: Thu, 3 Oct 2024 15:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: gpu: ipu-v3: vdic: Drop unused prepare_vdi_in_buffers()
To: Linux-Media ML <linux-media@vger.kernel.org>,
 Patchwork Integration <patchwork@media-ci.org>
References: <20241003122813.44746-1-marex@denx.de>
 <66fe92ca.050a0220.2a56c5.04be@mx.google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <66fe92ca.050a0220.2a56c5.04be@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/3/24 2:49 PM, Patchwork Integration wrote:
> Dear Marek Vasut:
> 
> The unreliable Media-CI system has found some issues with your series.
> Check the report at: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/64596985/artifacts/report.htm
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> If you believe that the CI is wrong, kindly reply-all to this email.
The missing media: prefix is expected because this part of the VDI is in 
drivers/gpu/ for legacy reasons.

