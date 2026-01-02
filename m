Return-Path: <linux-media+bounces-49839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2846CEE2EA
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 11:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3B913000932
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 10:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D172DCC04;
	Fri,  2 Jan 2026 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="M/x8nmCp"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4811327A47F;
	Fri,  2 Jan 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350598; cv=none; b=awN9Cjak5G8IoCkzdqI6IIWQss9Wc7QsdE6NYMc82wewG4KvLedCrZ2Qyd+2KwIvvQKdcJ9hwDo9979KiRHI02giQe5/YX2Ep3KQNXscSomC3+ZZgNXx1dTBBAvP20d9MhxiQBdoEV+VDS+OLC8Fc+6w86HqZisgdT7qHItHMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350598; c=relaxed/simple;
	bh=/Qvz2n7NNcxKi0p/Lmq8yoka79LYyN+s9ZSy1pLpJ6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIZcjOdrQsSWFI5wfb2mg+gU3RutBoim9Jct8BtRQOp6MfCbrJOY1rkQZ9mnvlwP11AOUIs44Y55IcrxPu5HzJv19NqqAlSRm9rPWC7oc0oQw4ATcPLSWiwurFY2gwM2eahzDZK0GV6+W9vTP/CuVvIiuFt00NlQzBKfZ+grGAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=M/x8nmCp; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1767350591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiWYsYquJgHtXI3YvPw6Yn2oD7sMmr28t22F+xPgFhs=;
	b=M/x8nmCpjjnflWqySpvPmd4IDN2pTiLNfxeKTmuGo8rOs2LEH4ngnPWqyCfTU9uK6Ghn9/
	ci5cVD2yP77QwypzJCy+L2FfrCLky2r3Iczl/LSRDmqtCMTnZjTsq3UCngOlydzOWZg77o
	vvKW1vmK1eopBFix2U4+PIseIU32bs/IpiFLXXXt1XlsiiX0cJ3CjTI27Hs0/xX2t619z2
	SRfnHZJkCyrnD+Z25ORlfpJZDaywCQZCzbMW7ZQdb/SqtUPXtMO7udbxPOrNslo8yOyZfd
	JeDqK6jxL5f6YvcjqENXDu1OGZOksqhkmUGg38Ss6MwS2R7ioOp1X8wWglKY+A==
Date: Fri, 2 Jan 2026 07:43:02 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
> Hi all,
>
> This patch series adds initial support for the AV1 stateful decoder
> codecs in iris decoder. Also it adds support for AV1 stateful decoder
> in V4l2. The objective of this work is to extend the Iris decoder's
> capabilities to handle AV1 format codec streams, including necessary
> format handling and buffer management.

This is awesome, thanks!

I've tested it with rpi-ffmpeg as well, and it works great (only 
required one interesting logic change.. 
https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/

> unsupported content with bitdepth 10 (66 tests)
> Iris decoder supports only 8bit NV12

Any chance we could get 10-bit support soon as well?

10-bit is massively popular with AV1, especially with home encodes (see 
e.g. https://wiki.x266.mov/docs/encoders/SVT-AV1#encoder-optimization 
and the ab-av1 tool's defaults)


Thanks,
~val


