Return-Path: <linux-media+bounces-66655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oYxaJ4g/S2rYOAEAu9opvQ
	(envelope-from <linux-media+bounces-66655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:39:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7670CA83
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:39:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S4CBLN0t;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66655-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66655-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85191302F730
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 05:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B383BE172;
	Mon,  6 Jul 2026 05:37:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126BF3AEF2F
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 05:37:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316237; cv=pass; b=UsCje0dUuaIYdiiprDdT06qoAedB2LS5f9+dVXtZbYWz9AkI4AkQx3odAcTcDjmRuFjK/3XSzkbsLoAkZCIkRQnclJm79qCKyTteETfEJJvWVLbrKoRc2VYAxEiTiZ8AOJ1uwt1dnSToBDSIe92ht2Lm8K/aVVkGVMJJ3wI+CpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316237; c=relaxed/simple;
	bh=CcnB2qLcUnvNos/QLkV19B3s0ALvCZX53wLvV0ri8Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5eQ/fOkDqAEBqHybh6BHVn1p+RqtVna51f0COguL8GsdgANtPVVgSKeVRzh8QXcEYrkBzMefQRq2qaOBG3tu1soz46hm+xdsnLqSojm2pQEQSu1iROLnLI2aNWcaAwVnVvUTJTE9oKsOh/ZyqJ8aX07lNy4wIXSjLe83WfGOWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4CBLN0t; arc=pass smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c126fe7d0f3so326619366b.0
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 22:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783316234; cv=none;
        d=google.com; s=arc-20260327;
        b=miwxgQ4bGqeEo3pByxx8hGQ737xdiQaENvwNxQh3/QQSuZXUP3d1u9lw6lU1wmfy/C
         kFAtpiGazkIOJFg2sOjvU7jtzM+/y8TfuO/vcei7HBCFTu0rZ8aEe0JKQDShZCH6Sr+f
         z5UGA9dpwO7T7z70yTeDygksM3QnwOQBHjfMVzOPmceoADyrMDYHZpP4rc6nYU3F7NrZ
         qO7tk8iXA5NhFcOJTcFmLgpzO4IEeE7vQmm9VLQcDg8GV7UIqI+NMINyx6OB8uNCIlSo
         e/TRuAgXHqTN7QAwEUlBF75gCU8/eJx4R9gXnw6ffJCAuNS8TwPUoHAXyLyUCKaSbK7Z
         zdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        fh=Knje4ZrzPq0N8lIVoxgQHMrFdKa8m6Mlfw90F02JN9o=;
        b=Vnkgb6BNFZqtdup2Yq1TE6/eP9BJxhxhYx3qZKn3rk//OSSV3XzEPxx/OWo/s54XXL
         KSxWSKn8razEAluBTQisn5BG5+yvWHmHrL8TDOhxRLX0FOr9m1ezam8hwCIoXWBJSrxU
         sdqFHdv+JXP+4qJiYe/l9xSigQMSmXbb1Ho5KRYvULEpQzt7e4ZFSKg5HzCQ8XDptuLw
         7O/2q7YPMKc2Mc8nW+51avGnjHaSJlCBJjJNXKHgwFvlaLlZn/sKcKjEavtWL0ucDiq7
         5FChrZ5SKEXb6SeLVjzLo1ofZkDvJv65d17DoDoATQaPJRi73bCdK+/Ln7KXDw9vuc+g
         5Osg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783316234; x=1783921034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        b=S4CBLN0tYc0qPluBmHVzFZ5HKXt4UvDkbF0y37qGtxP6kVd/nR0urEecgVMOjL3M9v
         a7gTGnFVba8iggQE2GbHcOfwjgf+LttTxhi5Hn+7MXh0/Mtcg36i5mmKh6z6b4Ttbd+i
         TJXTH9AUjvcMlGSDcQxETlDEH0YSQsffmpzdY0xYdz2+qom5NfgGV1psIskvQgXfJ8it
         q70LcZVvsEjWpJkqzgL4ePDmcNAMVnu8ubXWvxEc9LRjZgCa4GC3oqCGX50LatXeW1z6
         Y2xNNtEi32hw5nOkgrCzReaTrtJlmGha18y1xIJSJ51tLiNy9ZHSxRxWJdbFim03JT1n
         plVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783316234; x=1783921034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        b=XN5AqT5e3ejkfXY6fSiPjWwjlBGshNNxcY4Z4cBDwMgjaWzG3JTwbj7jNkc6VSvivt
         e6IosOomwKk5aQXaNJK4EVdJMeBB38pGFMmb3JBz7zIkefWXsCgOQO587S3/KnyTo8yx
         P0/bYoe8E/iXLnaoHS7E9rcWFZSaQAHIDSalLDDYvYxlahZCDOG6lUh+cJxGx0FQam+U
         NhLMV8ZJHTMWIxsHpCSg9E+CfCyvxGxdiffuZrBPWNuoOAp4YorCE5JLsRpB1qh5xTs0
         Pzm3yOAzQB+ikH3ZMa3Tflzn7mXDiA9hhjRCaY3BPElZIpkaeGwi7+sWoIUUOmx/1epe
         V3Cg==
X-Forwarded-Encrypted: i=1; AHgh+RpHLwuyXfCzIHC3NLN1rEQMApCN8N87cEMl0R8C9aabkl7DMMXqsqTdzu6uJ61KiRf1itoiNIT62RWbng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVu9JoNQ9h/EdxKv9EPEdT3Ryv16/wCUY8qj4Svizzr8FccXq/
	iB5nqByNLbCslLKibxRCrwwOnoT0iV/rR5DPgh68mViT+kNFd48C8KMKKf7oorM5GxLW7OgEDeo
	8fHQpih7EMfNb98VBlY4bMEK5ufGWz24=
X-Gm-Gg: AfdE7ckuP+seAM2BlK6xjuILYF86DOIy9s02BalVjtCYlOKBoQFJQ3Pl/Er+KpN6tBL
	c4R0qD7mb1NVDw9Z1sH78yjLa2mlp7fVDIApTzrCgsK5+9cfrI95f+eVJSqgycr0PmI8WqNJIxG
	CKuyq6J3Zfo9n0Na2QRtKny5RHwgP650O/ereeCEpxlKTRBReC0aNmVUyE0YGvESAb2wPKhmw3N
	DO5oswnO+dLSGwQS5dP7NogIT0QnPwp6tvFwnLdjT0ThDuLqWWs2BCGH0e6Tw3W1I5H+DsoF5rw
	noOl2f+OqANxg5Mr6x9thnQ36dZ1wc7Qoq/0OYMUx8fMemdgK7HXXrdFV2mtXRgfp768F0sPGHZ
	wlpk+o77P4o70cAkO6AfKkGECEVH6GhA6gc8vCnteIwKZy7ttOKmcwjMvJg==
X-Received: by 2002:a17:907:86a4:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c12e6b4b6c0mr263440566b.30.1783316234307; Sun, 05 Jul 2026
 22:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
In-Reply-To: <20260706000738.18478-1-nealpatalay0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 08:36:38 +0300
X-Gm-Features: AVVi8Ccs0fENx974odzMq6Kfd8aznTpy2TJ9OPLzskxRndR1IFnawe3x5Y4OW2s
Message-ID: <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-66655-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nealpatalay0@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEA7670CA83

On Mon, Jul 6, 2026 at 3:10=E2=80=AFAM Neal Patalay <nealpatalay0@gmail.com=
> wrote:
>
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy() size dropped
> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack. Address these shortcomings
> and reduce stack usage with a single 256 byte buffer via a new helper
> function, ia_css_debug_build_info().

Please, slow down! No need to send a new version immediately after
replying to the previous one without settling down all aspects of the
change.

This version is no go, sorry.

...

> +static void ia_css_debug_build_info(char *info, size_t info_size,
> +                                   int *offset,
> +                                   const char *flag_str, size_t flag_str=
_size,
> +                                   int *line_len,
> +                                   int *num_lines)
> +{
> +       int len =3D *line_len;
> +       int off =3D *offset;
> +       int lines =3D *num_lines;
> +       int len_written;
> +
> +       if (lines > 3)
> +               return;
> +
> +       /*
> +        * If new line length exceeds max line length,
> +        * replace the last ',' with a "\\n".
> +        */
> +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> +               if (lines >=3D 3) {
> +                       *num_lines =3D lines + 1;
> +                       return;
> +               }
> +               info[off - 1] =3D '\\';
> +               info[off] =3D 'n';
> +               off +=3D 1;
> +               len =3D 0;
> +               lines +=3D 1;
> +       }
> +
> +       len_written =3D scnprintf(info + off, info_size - off, "%s,", fla=
g_str);
> +       *offset =3D off + len_written;
> +       *line_len =3D len + len_written;
> +       *num_lines =3D lines;
> +}

This makes helper too ugly and unreadable. Again, study the case
first, when this can be true. Do we really need to cut it? This whole
thing AFAICS depends on the dtrace facility in the driver. Is that
HW-related? Is it pure SW? You need to perform some homework.

>                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtrue, wid=
th=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
>                            bin_type, blob_name, enable_info, blob_name, i=
d);

Yes, I can understand the frustration, but this driver is not an easy
low-hanging fruit even for (really useful) cleanups like this.


--=20
With Best Regards,
Andy Shevchenko

