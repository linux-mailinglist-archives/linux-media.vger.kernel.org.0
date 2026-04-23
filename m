Return-Path: <linux-media+bounces-59373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB2oHmHc6WmNlwIAu9opvQ
	(envelope-from <linux-media+bounces-59373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:46:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D264644EBCE
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AF4D301AF6C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DF63DEACA;
	Thu, 23 Apr 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chub7vzu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BF36492A
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933838; cv=pass; b=PJsf77Pnf47QrBOPPO4422v2OpX7q58h1/TSbwM6xO68cQzRhtSeIgL0c3XKQycsx3Si6Kt4oQiOKxyjua19a0ny1AUSv7jM9p+rF9uiTPCNsK3ottvb//d49NZ6bG0OTBduqZd4ACOMClzEBcoMTRPSmp8O0/d0hsy+E+UHXyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933838; c=relaxed/simple;
	bh=n+iYaCU5RlLEC05NRoIMkSJ7zXazBUXFF6WXu80S3fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsfrD0wA0X0DweOLT6sm7XeLGOlDIko413IqDcNeusW7qopGuUnnK846x+8GVKhXndUnj/PH57hkMJhmmBiljh6wD8zyXpjNjB4Y+jaFIZ3YF25CRq1Pijvn0z1+W9XELtp6f8if2l7k4CxR6zunMctvxJzrEa897qKURnvkhf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chub7vzu; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso29847605ad.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 01:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776933836; cv=none;
        d=google.com; s=arc-20240605;
        b=GYgWFixGVK4w5e51Urw6NEM3CCosSCSEiLl17kBq9Ugkx0VYvZvRM4aq5lWx+j6V5T
         XdJ5dMYJC2oHa01iaYmSbW7rUT4cLlKGT4pWhDZudBVo78X8nek/wBaEpbjcbRCEZd4Q
         ftMBq7ogU+dop8H8f19VqCiRMNTXjUgCJydPj8wvcQ3wanfDiBu8Kp9hHj1iQI6qYedA
         MTwu3nweAuA/4b8CfeHRX5791ol+b/lcLTydnn2r7xxvkKSOHrmsWS2CIc/6ftUOJzdO
         6bosDpckZr2+8jpM5Z/yAgO4RneJW314Uf1157voyioEXi/HmUdtYmx3rfT+C6UH/cge
         xm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jr9UMRBmBHApUaaVA6PGTNjsiCshkBi9jhFnl2kVkFI=;
        fh=v9ppgtpX+U8NnGJJhD3vFbLVq9GLYrCSAb/y1IAYjhs=;
        b=TYc90wWGcaVkS1nN/+f/kWwc4nDvVPhPD/Gwk19O6dvirbjihgC6A8wFDpqmhovqWa
         n0EYCCocZvtfRayyYRinFI9W3BepU/tobfafw9Lc5jdZS1fbGxXnpo/LA4nQu/yiFs9H
         2MscO03Ywzvtba69cyz/0nltrnYPb5z3SfJ3msf53oOoSCVov4qXvCCIgQlHdyWdUCBK
         IEmMIRcUkq4lYh0GIYT5I22rJIPevaM70XJHmcN5Ay1jTsjmNlpKT39N0iRcwpVAkDuU
         B6Hc0PqWuP3YTEqh9vtdKnFZ7HutvqafZNJ0MVN5JjFEQHFayP4wSN53qkL0JvmgYvR+
         xyfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776933836; x=1777538636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr9UMRBmBHApUaaVA6PGTNjsiCshkBi9jhFnl2kVkFI=;
        b=chub7vzug0voN7YBxkxMquPGujui7h0iK8v8slDx8RtzVwGwS/Bi3EaHwU6kFake3b
         kIiNGDBLehJdVjI/tvnALZJ1elFz8xcqwRZuTCAcN5hadVk7/oA1pgcp+1Hf6D7ZZCD9
         vKasiN0Q/QxegmzG5zk9HyjrkJ0ccDllBJwrH5iQ7BZVt1WP7k05MBvu92cyZwEy7kpx
         NLSSXWLf6BLb5RI/ZkFbySaj26NDYVzrfRbzZflFk+BaSDFOZuYwFcaWEWXEIgTLNwOq
         H8eFFCCs7kJlLH+hP18x8QzOsH+boJiamcQsXm2S5dXDKo9/Zos/7nB/10hoyxkKx1Hg
         Rn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776933836; x=1777538636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jr9UMRBmBHApUaaVA6PGTNjsiCshkBi9jhFnl2kVkFI=;
        b=nfN9iAP31G+oZr+bTn0+Z2WYjIAUkjLq+4bFY5mkDaAo5oLxFOzWwoFQyNjNiuhh6B
         D9tvjiT1fhrFa858G1SDwT7Bq2UZcbL75T1paewlL7kQSMHjjSxzltPEqTwP73obXm9b
         c83Ka+NQjIP+df0GY+qvaWZ/6vcdF2uzJel6pBFmz0b8Uos6NqfPnGqO+F0eXBQB6Tzu
         lipP/7PdcTVFSdfajzRKZ+mDw92/ajqLpcm3If25dC/d1OuT10Zj6IkhWEIy31hO9YhZ
         PVgsMub9rlMmS2ExxuXo2mwSubAbDVqeVV5YAeNweg/39IOVybmDH6S8s5ZtHd5N6pb1
         zB4w==
X-Gm-Message-State: AOJu0YwB4zSnJB9fwxvSSamUI7OXUF3w7sG7hw26jMWdSV30lNNUUKtZ
	GoBxc6S4NMxjpxEXrtDrncrLj7YCzmqgCDfGUBbHQ/PazTHUvNG+WP6QEd7mkn78lqLA17ScSRh
	nXRYFBxQMIB7WiknMDURHV7FnKYQVqHd3gva5iYY=
X-Gm-Gg: AeBDietR+odiJUi12AZJd4vf0FTPdkjloK1ANR20g8OZw4fJxvUctOcsQ8SoezOFBxY
	6wo48BZyE1xTDgeEZmsL9Zf33zRZFUwvxXFjwTHdV9ub1GK9jS6vBCIyraet22nt3HseYe8aM02
	nRnxCYO6toe7b/XwJsdj2CZ0+1HXvtcxPApYIUUbh7nYGcNccxcn0xoenm0Y0jO6yXwiYgKAlU3
	9CtD1WRkH9I23WezgoREZRq6qbnEKG9vhUxfsisk899utQ40Fs/278NA+uxTcbYuxeKo4ud9JlH
	AGkwQ+SSWeD/m3KU7y/ThYPEk9LAQtjKRFoZ0ayzFh20mFDMt22x834tn1cJzVqO0BGeQ00Y6pP
	IB30wW/c=
X-Received: by 2002:a17:902:d50b:b0:2b4:6470:760d with SMTP id
 d9443c01a7336-2b5f9e8e436mr274658925ad.14.1776933836244; Thu, 23 Apr 2026
 01:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413094639.8615-1-esty5664@gmail.com>
In-Reply-To: <20260413094639.8615-1-esty5664@gmail.com>
From: Esther Zilberberg <esty5664@gmail.com>
Date: Thu, 23 Apr 2026 11:43:42 +0300
X-Gm-Features: AQROBzAzhwDZ8p62TlzG5DuKgQ5TcRWIql2xENd21WUhb0-SDSrfHfsUqkl2TM0
Message-ID: <CAPMPFbjQ5nLFxGUQ5bOvvyW+hMVJ6wK0e-w9APTs+b=34GJ-OA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils v2] v4l2-tracer: retrace: support all mplane planes
To: linux-media@vger.kernel.org
Cc: nicolas@ndufresne.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59373-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esty5664@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D264644EBCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:47=E2=80=AFPM Esther Zilberberg <esty5664@gmail.=
com> wrote:
>
> For V4L2_BUF_TYPE_*_MPLANE buffers, retrace_v4l2_buffer()
> only restored the first plane from the JSON trace.
>
> Restore all planes by iterating over the "planes" array and
> reconstructing each struct v4l2_plane entry, assigning them
> into a properly allocated array.
>
> This ensures consistency with trace output and prevents
> incorrect buffer reconstruction for multiplanar formats.
>
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
> v1 -> v2:
> - allocate planes as a single array and populate it directly
> - change retrace_v4l2_plane() to fill a provided struct instead of alloca=
ting one
> - fix indentation to use tabs instead of spaces
> - add blank lines between scopes for readability
> ---
>  utils/v4l2-tracer/retrace.cpp | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cp=
p
> index 010936c0..f4e4d3c7 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -199,10 +199,8 @@ void retrace_vidioc_reqbufs(int fd_retrace, json_obj=
ect *ioctl_args)
>         free(ptr);
>  }
>
> -struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memo=
ry)
> +void retrace_v4l2_plane(json_object *plane_obj, __u32 memory, struct v4l=
2_plane *ptr)
>  {
> -       struct v4l2_plane *ptr =3D (struct v4l2_plane *) calloc(1, sizeof=
(v4l2_plane));
> -
>         json_object *bytesused_obj;
>         json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj)=
;
>         ptr->bytesused =3D (__u32) json_object_get_int64(bytesused_obj);
> @@ -222,8 +220,6 @@ struct v4l2_plane *retrace_v4l2_plane(json_object *pl=
ane_obj, __u32 memory)
>         json_object *data_offset_obj;
>         json_object_object_get_ex(plane_obj, "data_offset", &data_offset_=
obj);
>         ptr->data_offset =3D (__u32) json_object_get_int64(data_offset_ob=
j);
> -
> -       return ptr;
>  }
>
>  struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
> @@ -284,9 +280,20 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object =
*ioctl_args)
>             buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>                 json_object *planes_obj;
>                 json_object_object_get_ex(m_obj, "planes", &planes_obj);
> -                /* TODO add planes > 0 */
> -               json_object *plane_obj =3D json_object_array_get_idx(plan=
es_obj, 0);
> -               buf->m.planes =3D retrace_v4l2_plane(plane_obj, buf->memo=
ry);
> +               buf->m.planes =3D (struct v4l2_plane *) calloc(buf->lengt=
h, sizeof(struct v4l2_plane));
> +
> +               if (buf->m.planes =3D=3D nullptr) {
> +                       line_info("\n\tMemory allocation failed.");
> +                       free(buf);
> +                       return nullptr;
> +               }
> +
> +               for (__u32 i =3D 0; i < buf->length; i++) {
> +                       json_object *plane_obj =3D json_object_array_get_=
idx(planes_obj, i);
> +                       if (plane_obj =3D=3D nullptr)
> +                               break;
> +                       retrace_v4l2_plane(plane_obj, buf->memory, &buf->=
m.planes[i]);
> +               }
>         }
>
>         if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE ||
> --
> 2.43.0
>

Hi,

Gentle reminder to review the patch below.

Thanks,
Esther

