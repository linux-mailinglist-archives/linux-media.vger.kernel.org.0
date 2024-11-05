Return-Path: <linux-media+bounces-20829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4E9BC563
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D5DD1C20C9F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 06:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC71D172A;
	Tue,  5 Nov 2024 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBxaYZOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6841C69
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730787858; cv=none; b=X4jMv4htxfumiMwKzJHtLpuXvCz8TI8SfHFukKpMNR9kQGiu6dhjb2GH1nibaDSLQOWX2OOpj06AFtsZZ/jFKe4suZseFAncAESHfiOQ0LviYjPR3XuHTGfIUXyfuJpDAPSj6QY5UTJdpAVD4P4xB0/FeswncE5j/YbN8K21GDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730787858; c=relaxed/simple;
	bh=daXZ6SgVbB83YjdRvmNxAmB+Z/nAz02bmk5rY4zQkQc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dHKC7+wjUPaUSJn96gKYq5q7WSuUUSs1SZUlJOxM4v1RRUIjugHoNsWmmiGJRUDiIAO+tcRMXHFo50Vn9DIG+t8H4OU32zMKAdgLa073uw5Rgx/4K0tg599MzxUMv1e+QJZF8gg5+Tug8GfMX2Yzb9LA19n/vPQfEAHjLXNABc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBxaYZOX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cebcf96fabso4438494a12.3
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 22:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730787854; x=1731392654; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a753P1qu6VUmzHUd0qhgylGgnZ+RG9GImRDIglYR2Qo=;
        b=VBxaYZOXefYVALjB1Uo6dePE1BQyTrB2tGXKQO9GI8Hdjg9PkDH/J48cJBslcnNhm/
         Bw3YiM3KWgiE7wffaj274He/vmO0Dap+lxCNWhiG7o1MoEWPnwxsVzgJCq7AVnrOqXlt
         4PUwfDCz05QSVE6ZFbq8rEpxXevOphPJFqTNVZvW45ffg6xV1T3xd5y1I5h+Epk9bYk2
         eqd4uri/FgrKPzOvIG74HHQp+AyD284kFDSH2bn42I7KXO532ecOEmGWhiVXTytyxflM
         JP9m6cW9wNxbzvAYnOavPcEZ4PCtAQrnpjfa/62/m4dh9L3QgszE/GS2x38wYPe3+2gc
         y2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730787854; x=1731392654;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a753P1qu6VUmzHUd0qhgylGgnZ+RG9GImRDIglYR2Qo=;
        b=GqwrIQogWcLI3xyXXtUF9ODWwRLsg0nzKNMLz0unAeLPOefFTUh0NZ2jaOUUlFpHiE
         rtkCda9QXnQvj2xY+uONQH/A7EG1OcyZ948oJaaXJ1Eyrsqzr6LKI7jL3JE4S+VyjgqP
         yT0GOUn7QaOcbMZTqlQPq87G0vVyi1east+qT17m3CSS5L5hSPUV4M6kryCpULiTXYHW
         FJIdCLAEekUozjmZjpdwvMETPqyNS3aWnl3EPxQDmucVo7/W3JpG+kYMM2ZCOz5ew4mj
         UO2e8GlH4eTrF0SbaTlyB2drY/Og4D0iRFs3PtfGWkHJ3ye4YmH/qtuPIospj5Hj0LnF
         V2jg==
X-Gm-Message-State: AOJu0YzqrfN8/K41D5702mvIV5OIlSPckH4DEzLYf7mrPwnEl+X0rkj9
	/JDLFL0UUQUH37dt+gGq02IiLqgh60LbHdAQe8rVK/YC/ok3bRcD3jfSovEeGIA=
X-Google-Smtp-Source: AGHT+IH0Coje8BKgBEVVrcGT0RIsYk349LSh2KWfWLjBpwVpZFARewFGba2pAXQQP6HLaeGG6jBvCQ==
X-Received: by 2002:a05:6402:90a:b0:5be:f3ae:b9ce with SMTP id 4fb4d7f45d1cf-5cea96f4b6emr14148184a12.27.1730787854216;
        Mon, 04 Nov 2024 22:24:14 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e? ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6a9a34fsm843866a12.1.2024.11.04.22.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 22:24:13 -0800 (PST)
Message-ID: <1229fefc-e2b5-4dc3-8a09-0a81c302fbd1@gmail.com>
Date: Tue, 5 Nov 2024 07:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-US, de-DE
Cc: vdr@linuxtv.org
From: schorpp <thomas.schorpp@gmail.com>
Subject: Buffer overflows recording HDTV with saa7146 and mantis DVB-C tuners
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've build a new VDR with h.264 xineliboutput plugin software decoding

and got a problem now with

buffer overruns and distorted recordings on all HD channels:

...
Nov  5 05:32:03 vdr2 vdr: [32753] ERROR: 47231 ring buffer overflows 
(8879240 bytes dropped)
Nov  5 05:32:09 vdr2 vdr: [32753] ERROR: 31042 ring buffer overflows 
(5835896 bytes dropped)
Nov  5 05:32:15 vdr2 vdr: [32753] ERROR: 47325 ring buffer overflows 
(8897100 bytes dropped)
Nov  5 05:32:21 vdr2 vdr: [32753] ERROR: 28306 ring buffer overflows 
(5321528 bytes dropped)
Nov  5 05:32:27 vdr2 vdr: [32753] ERROR: 14033 ring buffer overflows 
(2638204 bytes dropped)
...

This occurs with both saa7146 and mantis pci tuner cards.

This has not occured with the old VDR system using Broadcomm's crystalhd 
decoder in libxine.

LIVE TV works fine.

I've tried stable and testing minidvblinux.de VDR live systems to 
crosscheck, but same issue occurs.

If I increase the buffer for the saa7164 cards with module parameter 
it's getting worse and distorted picture and sound.

Any Ideas?

Increase VDR's buffer in source code?

What is the correct driver module debug parameter to provide a useful 
debog log?

Y
tom





