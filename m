Return-Path: <linux-media+bounces-20786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D69BB275
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498351C21DFB
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47BC1F472D;
	Mon,  4 Nov 2024 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ve4SD335"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F91F427B;
	Mon,  4 Nov 2024 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717712; cv=none; b=SHgUFaFnQDAWPiXqWcm/cxh0a6vj3UG3bv43h9kOaIMIPFGA/LG3m7g0HufFIX4y2BcvO+l2y4MIlqhJmp+LCVyjiqBnZD+OtDg/8ShnAZaxJ3Ui0QD81Qn4h5GbJO/syDjU6VD11GVhxurlDzyk6byGqIbu6JEoDMDTtYR+8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717712; c=relaxed/simple;
	bh=xXMIAfIX2Epoxbu+Ed52JjHAGo50jerj0V0oSVXTFmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGBNwPNRbiMALjkqagTDuuMoo/lUqspRQQTZEFBiKROWDXF648PvZNg4b79UhN17YS2TfgJttT8fmv5p3iU4vFs3sMR7MuFdoUaGy4Vgd6ZiQu8SNZGY4npr6hajJxLYrJNxlSEoFeR4pALG3YrFpEp/GBNMc/IZzvZmUCWoAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ve4SD335; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09746C4CECE;
	Mon,  4 Nov 2024 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730717711;
	bh=xXMIAfIX2Epoxbu+Ed52JjHAGo50jerj0V0oSVXTFmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ve4SD335ip/cv4JsiOPII6reVBDEbb5fzAWFn5utmhv6c0FAUvNDUY/fGB4E45/HW
	 TY08iHWrwx4qtppFKXsy2nAULA6Ay98rMu/S751o92lts8ctxOM3Ymt8ZgQJjOMfid
	 BsGhapKziHk8yOFYj/rYpTagQcxALcwzpWwmohbc=
Date: Mon, 4 Nov 2024 11:54:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Li Huafei <lihuafei1@huawei.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, Alan Cox <alan@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <2024110448-liqueur-length-2abc@gregkh>
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
 <621ad79f-8a8f-460e-92df-c3164f30e46a@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <621ad79f-8a8f-460e-92df-c3164f30e46a@web.de>

On Mon, Nov 04, 2024 at 11:15:21AM +0100, Markus Elfring wrote:
> …
> > ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> Please choose an imperative wording for an improved change description.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc5#n94
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

