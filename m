Return-Path: <linux-media+bounces-12675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167C8FF353
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 19:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F5B1C2644C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADC01990B5;
	Thu,  6 Jun 2024 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="tEjzMInL"
X-Original-To: linux-media@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC38198E9D;
	Thu,  6 Jun 2024 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693647; cv=none; b=ANmZBDrUQ8QL5AQ5q0LARg3c5uNy0GFdU2XbVEjJ3xKkfqKAigC7Ua3XrJ1h5xXwccYWoW5NxvOXmnvAI6TBPbdTIddAg7YY661vvkDdFc+x7irF/BozB02VREBevQD7z78Lx8ru3kKjlIWOJOeGFoU62ss/nbsxItO2dP4rpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693647; c=relaxed/simple;
	bh=VHeCFpZ4RLjLPsgfwnjzI/Q85iwyJ+RtoWl8FIrsD88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3zR5wUbjjkixFtMHUYhsh/0JmSyXHQSWXn/6n8bE1vMiQjY82oJLr4h5F4VU5tgDNHitUxz3rTfNckvq4FXKf66M13oCSkwpbtvfxEH2LpiTTs9FFI/XVMpBqFbAY6uwf1Z/5FeZtLT0BEJ0PvJY62vAj4Ww0ceeb+6xi6on+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=tEjzMInL; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=q3W5rfNL8guHDyhomXxmXikuxMu9J7xD/p7JIYr3z+U=;
	t=1717693645; x=1718125645; b=tEjzMInLsMiSxTU0DZuZ8+deZ/8km6kNwnYgfYK8BPU48fl
	ZjNqAd91d0lt1QaOibYLY6TxIH8xJ6LCnO/EzHmq6MsABOSmr9FXKEw1XAluuzA5I2jg0xc7DnKFT
	kLtKPm+0RQcxMYCdRWtlfLfuheWRSaqB96zYsMrEjbOOT5aIo/zop8LmLFJ7Uwidp8NMxV8IwW1BQ
	Mw25zGvmXqNROJ4nFZ90Suxpp4h3kYO+ERJEEEX0mR3F4yYzK8wvGR5B482hjfdYqy+CSU9rRXyXY
	7AyOCUu4xrHqI5SrCqR7YMr2XUBsG4vxqrBsoJgqNnRqRhn+Kh7G/7udDOHztHLw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sFGa9-0005yl-1v; Thu, 06 Jun 2024 19:07:21 +0200
Message-ID: <7fb5f0d6-f105-4219-839b-908c96c42972@leemhuis.info>
Date: Thu, 6 Jun 2024 19:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
 wentong.wu@intel.com, linux-media@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
 <ZlTllJeZBiGapHwZ@kekkonen.localdomain>
 <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>
 <ZmHasj3hfwwKimZF@kekkonen.localdomain>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZmHasj3hfwwKimZF@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717693645;9f33a5f1;
X-HE-SMSGID: 1sFGa9-0005yl-1v

On 06.06.24 17:50, Sakari Ailus wrote:
> On Thu, Jun 06, 2024 at 11:39:35AM -0400, Genes Lists wrote:
>> On Mon, 2024-05-27 at 16:58 -0400, Genes Lists wrote:
>>> On Mon, 2024-05-27 at 19:57 +0000, Sakari Ailus wrote:
>>>>
>>>> Thanks for reporting this.
>>>>
>>>> On Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:
>>>>>
>>>>> First happened in 6.10-rc1 (6.9.2 stable is fine)  
>>>>
>>>> Do you happen to have .config available? A full dmesg would also be
>>>> helpful.
>>>>
>>>> Does the system crash after the warning or not?
>>>
>>> System stays up and remains quite usable.
>>>
>>> config and dmesg attached.
>>
>> Hi Sakari - just to let you know this is still happening in 6.10-rc2.
> 
> It'll disappear once this patch is in:
> <URL:https://lore.kernel.org/linux-acpi/MW5PR11MB5787C81ABF0C9FFF5A17E4888DF32@MW5PR11MB5787.namprd11.prod.outlook.com/T/#t>.

Do you plan to submit this again while fixing the typo Wentong Wu
pointed out? Or should Rafael (now CCed here) fix this while picking it
up? He might not have seen it as he's not in the list of recipients; he
furthermore is likely not aware that this is a regression fix, as it
lacks Fixes, Reported-by and Closes tags.

Ciao, Thorsten

