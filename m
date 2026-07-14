Return-Path: <linux-media+bounces-67543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lfN2CBPkVWpKuwAAu9opvQ
	(envelope-from <linux-media+bounces-67543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:24:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BD751CE6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:24:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YKJpkYZI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67543-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67543-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EE9B301C2F0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0543EDE59;
	Tue, 14 Jul 2026 07:24:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC523ED3A6
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:23:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013839; cv=pass; b=myYv2+nmsA7FUYXxtd/dibjx5vnn73C8KC4B1DE/ZWS4VJLe2UfhAzmvw1dmY4WByDHHg3QVX5Ancbzg6Yq7ZjGasGVWcDihdu+llr5XH7uaT8XhAaeehAq3xt1YEoZ2sDReO3BZCY1LSpb7LTfBIETJW7pw9cESfHkwT/Xf4MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013839; c=relaxed/simple;
	bh=UpfozN3EwKE3mwnRPUAc2uAXRnO6CkpDnAeOhOziE+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6cZjDfg6HWlZnXUMemQAGhou0BYA2UMwuOqe5wDmruwFNvmPidVinm6gVL06hSnzopmB//ygN+M4namQpMqMTSs3ZgggJuE+zOm9YyYjmBd0fOc858dotsp/tNq1LSl1DuXgYu3TaHRsauVXB2vP/Cszd9fWv33pQkqjaNZRkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKJpkYZI; arc=pass smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so5866971a12.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013837; cv=none;
        d=google.com; s=arc-20260327;
        b=nkvzVR8StYhTL9OPjKHxi8d0TquMQI1i9EF40kOupoSjEdgn019VfKJYQi4QcsiqMs
         QoggSYiJvSOgkEMNoZdCEG43WX4UjJqRGQ8dJ3CUVH93hYbtlUFKmd7nDY/Gt8IKnncf
         awisW5+1DgzFD0/GzbPomAAO3T72xbejHRWhTh2fJQcxEgh1vnpvpSQXrg5bG/heERlD
         DEGiG5YF3KBVaaT+BU3wRRQDS42qsY03Gc4Pf7U6Pw5NXP56VLsFHweS+RAPUvfZ05w1
         uwVDsRdl8tvHK2nO/aDpGTpWZs5ttiUDAn0wxj090jhYXvDw7aWiOZffvG8XIL/0dS0s
         k74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        fh=6cLgD9muJfGxnuMJhqxPkOknIlhq+krel6i9mFgPJVQ=;
        b=PJCem+e/ZLWH2WmVji6mR4cnl8JGuEoJvDO/IFLvqYqplGU36dd1RngC5WTaW2IJk2
         dfMCIE61NsgB7VGq5vBvYMnbX8DOpWY53593ps74L9FUUd3dy4z8G78aT/7OjmziynyI
         ANUid3raZIdHDTcPXwS+6mgTV7Ci0M1b2PbvmqyRo/2qvGXnriPmvOorFh77LeIEMvS4
         yQJ8kg7a8M7tjXixqhcDhVQ5u/CWpVV7+j2RQy2cBXl2R5uoHlj3hgECGvoC2NrqjqS9
         gfQbxMbgqhw+GI15jMjm4KNiKgmTxlX0nmGe/8C0qBd28ywh7NYZDtjF6lFxpAjvSFwZ
         8PYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013837; x=1784618637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=YKJpkYZIT429i2xe9zdA95nGMDoJfRrNwlunNLOd5mPdBc8eo00wUl/R63dcXp1+Ke
         fd9BfRo8sd0P0BXvFIdX8JrwYwrzN2Jsp95Gl2UO91erP7fPnh2suZ2LtoUvbGzf9fPw
         Kz3/u83coZQlyO22sRixNRrgUNdAtGm8H3MG844XgJyEOcZt2raYCXDhVFdwhImnLKQq
         oCTjNS+tLGm4UTSLmMj53S1S1pKdUbxtI6Sg4EikaI77LDuWT9xs/CMmU7Cm5szOArXc
         MFWgguToLHRrPZH8H7qs848ijn50ZjMS9VjUxc2El/eHb/62P+fpNJgF8KPg9dGiifj1
         c7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013837; x=1784618637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=jrNS/T7A2zbJAQ/ZjpYMylwwd3DHLvZ5O3uQCUiR0fZapEUQL+NdUlq9TUA/HcCsfg
         vr+40yTA+Cv+WqH1mXPHfkm5meykZAWEpfiIy4NDbiPoeSI7d0lJhgVj9rzasN90UNOW
         pumeoV3jo4pYkQ9aDtyPQMPA29xe3Xp+NWlz1+vTvplbEBBzPCu9BhXHiKXu+qUTzyTE
         1KTl29AmBZFIKSKNtNt0YQuvJTuAtkGOnsHXIVsShVOZbW0p+levQs59LGdxEf/mSQ24
         lqnZxSErv8VyI1UwZojMsF2BtX+o9tN/kmctEIUgTuechhRtpELyaialBHOaAPpqJ1J0
         iRHg==
X-Forwarded-Encrypted: i=1; AHgh+RozPaVNIQMGXA4134fXBxoPGuRdo/mlVS26m/AIL4BS+DJkcg22PzpvHeaTUXIgJoqCSIgcAUPqs9NUuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOJmVlNSUrIWSW9FU76u49/VvrpBE404OJz0QxHoCe9ohJ0dC
	C3igrfuMPmPRs3TZ9qc8y2cgeqh6sghpHxYFfW89phCfjeJ5loVedVLUXPA7IP+t7UEYjaBBWRQ
	DxS33c0jaKyRJ1kKT+/x0tA6fU14ABTc=
X-Gm-Gg: AfdE7ck6XBUWFGUMwv4txdjenLNVzjTRqlnhIh9lCsxpbJuY55D0nqwEpqf1MBbaNrz
	lNEh/JzbjBWU7rHm1aHCbvcDoSaOA5bjkdppGjYQ0+fxFgJzOGdSW39675pSu72w8+NUIepVnRO
	3ec3zslBrwzG0lQ1Emb2nnlzHE/SWvBkJbHVBvzWbmZU3Ox3sqT2qYAzsoHcOA6L4wNNztBJYu6
	UOFk1e3Z2oFjgEGRIARjvhMh8YmtybiKKOo2idv1SgODqkFAiOvefvlno4tYnwjCvhoEwbSVGjv
	YD2r/w==
X-Received: by 2002:a05:6402:e94:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-69cd2a001acmr1004913a12.10.1784013836409; Tue, 14 Jul 2026
 00:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713120840.17427-1-linux.amoon@gmail.com>
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2026 12:53:43 +0530
X-Gm-Features: AUfX_mzvXnkQt9N3uwj4z53r62LfKGSebrr5Wzfs3imVuOH5yaZKNS9xAf_UWqU
Message-ID: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67543-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A38BD751CE6

Hi All,

On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch series addresses a collection of critical race conditions,
> memory leaks, use-after-free bugs, and resource management issues
> within the Amlogic Meson video decoder (meson-vdec) driver and
> associated components.
>
> The primary focus is tightening session lifecycles, safely synchronising
> the V4L2 m2m framework callbacks, hardening work queue operations
> (esparser_queue_work), and correcting buffer validations to prevent
> stability issues like KASAN out-of-bounds errors or stream-on timeouts.
>
> Summary of Changes:
> * Race Conditions & Synchronisation: Fixes multi-threading and
>   execution races across stream-on, stream-off, job abort, and
>   teardown pathways.
> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>   vulnerabilities by safely pinning, canceling, and sequencing
>   device removals.
> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>   parser, properly tracks ongoing buffers via atomic counters, and
>   prevents invalid memory writes.
> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>   canvas handling, and buffer sizes to match modern hardware demands.
>
> Note on an outstanding issue:
> An execution deadlock occurs in the driver workqueue path during high
> stress or long playback sessions. This stall is triggered when the
> Amlogic hardware internal video FIFO buffer becomes completely full.
> When esparser_queue_all_src runs, the capacity validation check is
> tripped due to a design limitation in how buffer exhaustion is handled.
> This blocks progress and leaves the workqueue worker waiting indefinitely
> on a core mutex lock.
>
> The resulting hung task call trace shows the worker thread blocking
> on the internal lock:
>
> Workqueue: events esparser_queue_all_src [meson_vdec]
> ...
> __mutex_lock
> mutex_lock_nested
> esparser_queue_all_src
>
> I have tried to address this issue, but the underlying deadlock persists
> under extreme conditions.
>
> Any feedback on this new appock is welcome.
>
> Testing was done using v4l2-compliance and active decoding pipelines
> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>
> The v4l2-compliance tests passed successfully via:
> $ v4l2-compliance -s -v -d /dev/video0
>
> Pipelines were validated using the following GStreamer script.
>
> [1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>
> Previous changes:
> v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>

I will review Sashiko's feedback. I will look into these suggestions and
work on incorporating them to improve the code quality

> Thanks
> -Annad
>
Thanks
-Anand

