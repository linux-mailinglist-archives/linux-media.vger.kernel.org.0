Return-Path: <linux-media+bounces-25442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6AA23706
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 22:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CBEF162168
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 21:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18221F1532;
	Thu, 30 Jan 2025 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="u+o3XrD6"
X-Original-To: linux-media@vger.kernel.org
Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981AE191F92
	for <linux-media@vger.kernel.org>; Thu, 30 Jan 2025 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274391; cv=none; b=QAcOvkyAE87uGMuiJz5tJg3XlQp8Ul8wfX9xOR4doPytETbX96OmBz1pGCCRvBmHLRIntLrQzQRcXD5oUSAFxP2qj1jD+FPbTpPS4i9kGz19lfOYbvJWBuOz2RwL5wT7t+Oox2X+ukQAlRU8xr1aIH2bkTLUB2q+EYsMffHt8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274391; c=relaxed/simple;
	bh=CdQpH2QJYQHBTVEkw+6x5tiM21k310OuB28JG4hfnTA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sbRYgLILKdXDXa8kFITzK+/PouYTgL8HyN06cfbUIUpZf4DdQ4KOACkIZ7VkF79AE/u9SrIMxj1jAtlmM43w85YAHHevUGJ1XqWXBDssjXvdpc84GOEabrRKLCb8cqgasUQ6cTdanudMPMH5oB4Hb+w2KK7QqzmGkZ/lfS96O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=u+o3XrD6; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1738274380;
	bh=ceRnqJqxZj5QOOrNLgLBL4o3YHQ/Skqh/9VfIUVZGQE=;
	h=Message-ID:Date:User-Agent:From:Subject:To:References:
	 Content-Language:In-Reply-To:Content-Type:From;
	b=u+o3XrD6Jhb5y8T7eENE7eYkY5oBjNwN90GnppYtI50Fzg4GTkWuCOKGn749r7bUV
	 tO7v01002Es0CM6ypzim68K7sECibJxlKeKvQMitaDOg+QlboPp47BP4GJngVfok4m
	 v9q7VBbZpIYJgpkJOCf4QBsbOCo+8kiFshCCBXg4=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4YkXxS25yLz1yGf;
	Thu, 30 Jan 2025 21:59:40 +0000 (UTC)
Received: from [192.168.178.41] (port-92-196-77-206.dynamic.as20676.net [92.196.77.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4YkXxB6SzJz8slD;
	Thu, 30 Jan 2025 21:59:23 +0000 (UTC)
Message-ID: <80fa5087-733d-420d-ba8b-06c67ba10cf1@vodafonemail.de>
Date: Thu, 30 Jan 2025 22:59:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Schmidt <farblos@vodafonemail.de>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
Content-Language: de-DE-frami, en-US
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-server: smtpa06
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1400
X-purgate-ID: 155817::1738274376-BA7F55E5-B7C8DFA7/0/0

[Resend to make the automation happy ... thanks for the hint.]

On 2025-01-29  10:51, Hans Verkuil wrote:

> Jens (aka Farblos), can you test this patch?

TL;DR: Your patch fixes the issue on my system, thanks.

Tested-by: Farblos <farblos@vodafonemail.de>

Details:

### build #13 - stock 6.12.10 kernel

[~]$ uname -a
Linux host01 6.12.10 #13 SMP PREEMPT_DYNAMIC Wed Jan 29 22:10:03 CET 2025 x86_64 GNU/Linux

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:17 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input30

# you also get quite a lot of these without your patch ...
[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
7

### build #14 - 6.12.10 with your patch

[~]$ uname -a
Linux host01 6.12.10 #14 SMP PREEMPT_DYNAMIC Wed Jan 29 22:24:47 CET 2025 x86_64 GNU/Linux

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11

[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
1

... wait ... let screen saver kick in ... wait ...

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11

[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
1


