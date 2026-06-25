Return-Path: <linux-media+bounces-65607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+h6MlrCPGrdrQgAu9opvQ
	(envelope-from <linux-media+bounces-65607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:53:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 349616C2DAC
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Btp/VkSi";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65607-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65607-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C75EE3030775
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 05:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FBE3BD64E;
	Thu, 25 Jun 2026 05:53:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF1344DAD
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 05:53:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366805; cv=pass; b=cBnGJ442Z0qn0xpzVuRTzskuqliesINg0OdeKkO80hsyT/XHvcSwWQcSeMoZvFRYNP2xktRctf56qCdIatqcPEphZSFmZcXls7ns7UUJQDIJY7x5TPEQVc6bJdqCTzEZYNFVclTgQUYY+XT/p59GxsdHQsFG9WTNLfElv3P7b1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366805; c=relaxed/simple;
	bh=UcLMuDlfKswMWCeEICOm0mMsM8E/qbUwDn47fZ1Tbwc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NJH9guJUphONN6ImQIOvYcaIxCI7Gyr2g5VDyATxbe4PFkPu3LdPQK7NCim2lgV7CI3NRBu0rM3xcMcQvFvBcCkmKztee5iu6swHB1FQ9PaRe9H73ErR0rtmMwiQLm51XaJMq168uoJg7U/GEBwH5qiX9QywAzhHml9bf/MGOeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Btp/VkSi; arc=pass smtp.client-ip=209.85.215.176
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c858014845aso232029a12.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 22:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782366802; cv=none;
        d=google.com; s=arc-20260327;
        b=iWmkaCkG/q3b9dqdvpaNm066OBeGTk/rvSLnD57v/o6KsZKQdW8Y2nVY+OI2Hx+G5W
         Wt/eteW4tuVR0RG1y2KEViWYy+Uh9cJFp/N8WQdM+OgiqZtoJXsbf5EBkSk/WyJc9Dt/
         oGnvkHLVGg/KcP+D8lA1fvuanE6sj66nyC7LdoL5v+UrAJWTi2zqqLPdUpBwTM9zzFUy
         3+dx9JbvG4+59osdJSRAmm1K49S8I4u288X4X2QBjbBl/m8BzYK33vEflFnRmgWVVPKx
         k4tbV/+yjXWS/Ed0kRZTBOzR3/IBpyc9DT9XTt6UP+u14MyK1CxA6ONgkREr0x9NC9k1
         SP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=i/0nN1cAk59Eyf8uZtnip8vN9e+rCNvZcsjWLq0aRyI=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=Be035gBmFB7d9MOznohwroyIQek12tr3BdA0vUYn7nGyuSCX+yFfLd3DJm46ICWs8e
         joNc4EdceN/u8tCjY7mTQ9/GnfoMj16QVIgUx9Wu+mrXq2mXV5MS99Y4rEmVqOojaJNh
         rSOj5isbf1upqsROtgU4hYrsdZeHf1JJCivYE8yul1a2cqOvmcD/gqpqjofaCyR8P291
         2eQF7HEzwc9jDrqZtJ9hDU+XDkNU8hDzM122030TPrAOzGmHRKNlADQlRKQO+ayJjOn5
         shRn7hs9LKXmpfn7wHIbKbke5gzmbsAWLt9XbQeI2eS9O9/iorw8kNWiJTB046N7dipB
         Lzzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782366802; x=1782971602; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i/0nN1cAk59Eyf8uZtnip8vN9e+rCNvZcsjWLq0aRyI=;
        b=Btp/VkSi24fKDt+B3HEIESthBLKqPIiRpuh9xnAylXpo5AoFs4/CpzUmP731rlL52l
         mwm3XKJvo02HJYG5DQ2V4wzSDHMkes564zdofHAMRyGosVodQtAxQ0ntLhjguyY2dqLN
         mfNdUyEL6MuuiNyVHdpxOD8yrK9j1/S9zxfUV1lA//z5w3oZ8jKU2KYXnZv/P/RLC1Yo
         FzSRhnZKoXEasOnQqT45x0+NduRPmDQgDBwUy5S0jIDyG4BTFlY8Jg8rSA7vdHenkH0H
         G/hVOnIGFz5RzEyAKJoVmDjR1jtMLsfLM8Dzz2XW64RfrbiADo240L8j8fB9/1n0RCre
         fL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366802; x=1782971602;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/0nN1cAk59Eyf8uZtnip8vN9e+rCNvZcsjWLq0aRyI=;
        b=PA2Xz2Tzug53e7Bla4JVqcVBHqvhcu/W66KBFBfMYefrMC7CPgS/gNCGzrCnpdfaGb
         05mvKeE+QsRE9xhleTxNkqPm2f513iLdWINrbjlq66zGl+CqvEENgyP68yMgr9KcrdEp
         XK4N/AX2Tna+jomiQv3VAfVrT4hjPiz5WZHLIgIIDQdnK3xzQlT9yx8lwz4Gk4nTEo+j
         IbodTWPjKnnMWTVBTZ+bINM9/f6chyu7tAjzj1FOqV+kRKCdf45henw9qjcn38oskb26
         WCGjYRCWkhpkGMeBX23TmGgmkniWHhHJBoaBVaUCei8elJPwPI4mnQSejkLhv+tt9gz3
         88Ug==
X-Gm-Message-State: AOJu0YzgbMKwan/05N8dMCu6e6LMxa8RQJ4eMpAGakQjqm4OBKgm1RbF
	hILZ1/mLC6qBEem8L/OyzxiEPts9lh0qF+YgmQ3YMIyDjfM4752vhBncegQLZruKV5KtlVbs54Y
	EQp4cIy4kx0dLdSZyrDCfLQ23p9KaAs2xJvBLjn0=
X-Gm-Gg: AfdE7cnvIdZQVhOnfoo6axm0OsrVSUUqL0dnjz7DAl3SijsQ2cfAfC80Er9Amc1EPzN
	H4nJuVWOTeQnxYpQmpTj8BHLj8sBHM1b7sFtMCqXkvu4sa/Em62hHGuD7Ukv+lqAA9R5o8mswLa
	sESLT2Ig2i8EJrLU7a73WSS8h+seWyDUb+Ci7TcnFfVBdc26GJQjcauCd0Vqd+zFqkX6y98iw0C
	v2lWt2dvPqZt8ZaAQzTlMIMg335PLcwu9Fv6sh2RaTlvUohdqhLjOBMwboedQ0XfylnZN9PRKG+
	B5rutnJOup7KVfJTNikVNDO5Ld+/13w=
X-Received: by 2002:a05:6a20:9189:b0:3b3:23b4:6950 with SMTP id
 adf61e73a8af0-3bd4ac5d9c4mr1080337637.18.1782366802521; Wed, 24 Jun 2026
 22:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sid <51ddh3art@gmail.com>
Date: Thu, 25 Jun 2026 11:23:10 +0530
X-Gm-Features: AVVi8CfZ1KUnUjH8LwM-o7zO6uLdT47pDm3YAvY1hSAm-5bnP-7U1RI0CK-K_vI
Message-ID: <CAMHuNrUDnyvr9PVT+oZxe=-vTNXRffapW-PdbPxVi+UtFCjZnw@mail.gmail.com>
Subject: =?UTF-8?Q?uvcvideo=3A_device_resets_on_stream_start_=28SET=5FINTERFA?=
	=?UTF-8?Q?CE=29_=E2=80=94_Azurewave_13d3=3A56bd=2C_iso=2Donly?=
To: linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000001fd51a06550d9ce2"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65607-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+,6:+];
	FORGED_SENDER(0.00)[51ddh3art@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[51ddh3art@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 349616C2DAC

--0000000000001fd51a06550d9ce2
Content-Type: multipart/alternative; boundary="0000000000001fd51906550d9ce0"

--0000000000001fd51906550d9ce0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm reporting a UVC webcam that enumerates correctly but resets on every
stream start, with no working quirk in current mainline.

*Hardware:* Azurewave / IMC Networks USB Camera, VID:PID 13d3:56bd,
bcdDevice 20.01. Internal webcam, Razer Blade 15 Advanced (2021).
High-Speed (480 Mbps), bus-powered, UVC 1.00.

*Kernel:* 6.18.36 (NixOS 26.05), uvcvideo 1.1.1.

*Summary:*

The camera enumerates correctly and exposes valid MJPEG and YUYV formats,
but every stream start causes the device to disconnect and re-enumerate on
the USB bus. Streaming never begins; userspace returns "VIDIOC_STREAMON:
Protocol error" across all tools (ffmpeg, v4l2-ctl).

*Reproduction:*

```
v4l2-ctl --device=3D/dev/vio0 \
  --set-fmt-video=3Dwidth=3D160,height=3D120,pixelformat=3DMJPG \
  --stream-mmap --stream-count=3D1 --stream-to=3D/tmp/t.jpg --verbose

```

All ioctls through QBUF succeed; STREAMON returns -1.

*Observations:*

   1. Enumeration is clean on every boot; full descriptor read, correct
   strings.
   2. Buffer setup succeeds: REQBUFS, CREATE_BUFS, QUERYBUF, QBUF all
   return OK.
   3. uvcvideo trace (trace=3D0xffff) shows successful format/PROBE
   negotiation, then the device disconnects at stream start. No "Setting
   alternate setting" or COMMIT completion is logged before the "USB
   disconnect" event =E2=80=94 the reset occurs at or immediately before th=
e
   SET_INTERFACE to a non-zero streaming altsetting, before any isochronous
   data flows.
   4. Failure is independent of resolution =E2=80=94 160x120 (smallest alts=
etting,
   128 B/packet) fails identically to 1280x720. Not a bandwidth ceiling.
   5. USB autosuspend state has no effect (power/control=3Don, unchanged
   behavior).

*Descriptor note:*

Interface 1 (VideoStreaming) exposes alternate settings 0=E2=80=937, all
isochronous (128 B up to 3=C3=971024 B per microframe); alt 0 is the
zero-bandwidth idle. There is no bulk streaming endpoint.
UVC_QUIRK_FORCE_BULK is therefore structurally inapplicable. Quirks tested,
confirmed active in dmesg, both ineffective:

   - 0x80 (FORCE_BULK)
   - 0x83 (FORCE_BULK | FIX_BANDWIDTH | FIX_HD)

The failure is in the isochronous stream-start / SET_INTERFACE path.

Full lsusb -v descriptor dump and uvcvideo trace log are attached. Happy to
capture a usbmon trace or test patches on request.

Thanks,

Sid

--0000000000001fd51906550d9ce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-font-claude-response-body gmail-break-wo=
rds gmail-whitespace-normal">Hi,</p><p class=3D"gmail-font-claude-response-=
body gmail-break-words gmail-whitespace-normal">I&#39;m reporting a UVC web=
cam that enumerates correctly but resets on every stream start, with no wor=
king quirk in current mainline.</p><p class=3D"gmail-font-claude-response-b=
ody gmail-break-words gmail-whitespace-normal"><strong>Hardware:</strong>=
=C2=A0Azurewave / IMC Networks USB Camera, VID:PID 13d3:56bd, bcdDevice 20.=
01. Internal webcam, Razer Blade 15 Advanced (2021). High-Speed (480 Mbps),=
 bus-powered, UVC 1.00.</p><p class=3D"gmail-font-claude-response-body gmai=
l-break-words gmail-whitespace-normal"><strong>Kernel:</strong>=C2=A06.18.3=
6 (NixOS 26.05), uvcvideo 1.1.1.</p><p class=3D"gmail-font-claude-response-=
body gmail-break-words gmail-whitespace-normal"><strong>Summary:</strong></=
p><p class=3D"gmail-font-claude-response-body gmail-break-words gmail-white=
space-normal">The camera enumerates correctly and exposes valid MJPEG and Y=
UYV formats, but every stream start causes the device to disconnect and re-=
enumerate on the USB bus. Streaming never begins; userspace returns &quot;V=
IDIOC_STREAMON: Protocol error&quot; across all tools (ffmpeg, v4l2-ctl).</=
p><p class=3D"gmail-font-claude-response-body gmail-break-words gmail-white=
space-normal"><strong>Reproduction:</strong></p><div role=3D"group" aria-la=
bel=3D"Code" tabindex=3D"0" class=3D"gmail-relative gmail-group/copy gmail-=
bg-bg-000/50 gmail-border-0.5 gmail-border-border-400 gmail-rounded-lg gmai=
l-focus:outline-none gmail-focus-visible:ring-2 gmail-focus-visible:ring-ac=
cent-100"><div class=3D"gmail-overflow-x-auto"><pre class=3D"gmail-code-blo=
ck__code gmail-!my-0 gmail-!rounded-lg gmail-!text-sm gmail-!leading-relaxe=
d gmail-p-3.5" style=3D"background:transparent;font-family:Arial,Helvetica,=
sans-serif"><code style=3D"background-image:initial;background-position:ini=
tial;background-size:initial;background-repeat:initial;background-origin:in=
itial;background-clip:initial;font-family:Arial,Helvetica,sans-serif;white-=
space:pre-wrap"><font color=3D"#000000">```<br></font><font color=3D"#ff000=
0">v4l2-ctl --device=3D/dev/vio0 \
  --set-fmt-video=3Dwidth=3D160,height=3D120,pixelformat=3DMJPG \
  --stream-mmap --stream-count=3D1 --stream-to=3D/tmp/t.jpg --verbose</font=
></code></pre></div></div><p class=3D"gmail-font-claude-response-body gmail=
-break-words gmail-whitespace-normal">```</p><p class=3D"gmail-font-claude-=
response-body gmail-break-words gmail-whitespace-normal">All ioctls through=
 QBUF succeed; STREAMON returns -1.</p><p class=3D"gmail-font-claude-respon=
se-body gmail-break-words gmail-whitespace-normal"><strong>Observations:</s=
trong></p><ol class=3D"gmail-[li_&amp;]:mb-0 gmail-[li_&amp;]:mt-1 gmail-[l=
i_&amp;]:gap-1 gmail-[&amp;:not(:last-child)_ul]:pb-1 gmail-[&amp;:not(:las=
t-child)_ol]:pb-1 gmail-list-decimal gmail-flex gmail-flex-col gmail-gap-1 =
gmail-pl-8 gmail-mb-3"><li class=3D"gmail-font-claude-response-body gmail-w=
hitespace-normal gmail-break-words gmail-pl-2">Enumeration is clean on ever=
y boot; full descriptor read, correct strings.</li><li class=3D"gmail-font-=
claude-response-body gmail-whitespace-normal gmail-break-words gmail-pl-2">=
Buffer setup succeeds: REQBUFS, CREATE_BUFS, QUERYBUF, QBUF all return OK.<=
/li><li class=3D"gmail-font-claude-response-body gmail-whitespace-normal gm=
ail-break-words gmail-pl-2">uvcvideo trace (trace=3D0xffff) shows successfu=
l format/PROBE negotiation, then the device disconnects at stream start. No=
 &quot;Setting alternate setting&quot; or COMMIT completion is logged befor=
e the &quot;USB disconnect&quot; event =E2=80=94 the reset occurs at or imm=
ediately before the SET_INTERFACE to a non-zero streaming altsetting, befor=
e any isochronous data flows.</li><li class=3D"gmail-font-claude-response-b=
ody gmail-whitespace-normal gmail-break-words gmail-pl-2">Failure is indepe=
ndent of resolution =E2=80=94 160x120 (smallest altsetting, 128 B/packet) f=
ails identically to 1280x720. Not a bandwidth ceiling.</li><li class=3D"gma=
il-font-claude-response-body gmail-whitespace-normal gmail-break-words gmai=
l-pl-2">USB autosuspend state has no effect (power/control=3Don, unchanged =
behavior).</li></ol><p class=3D"gmail-font-claude-response-body gmail-break=
-words gmail-whitespace-normal"><strong>Descriptor note:</strong></p><p cla=
ss=3D"gmail-font-claude-response-body gmail-break-words gmail-whitespace-no=
rmal">Interface 1 (VideoStreaming) exposes alternate settings 0=E2=80=937, =
all isochronous (128 B up to 3=C3=971024 B per microframe); alt 0 is the ze=
ro-bandwidth idle. There is no bulk streaming endpoint. UVC_QUIRK_FORCE_BUL=
K is therefore structurally inapplicable. Quirks tested, confirmed active i=
n dmesg, both ineffective:</p><ul class=3D"gmail-[li_&amp;]:mb-0 gmail-[li_=
&amp;]:mt-1 gmail-[li_&amp;]:gap-1 gmail-[&amp;:not(:last-child)_ul]:pb-1 g=
mail-[&amp;:not(:last-child)_ol]:pb-1 gmail-list-disc gmail-flex gmail-flex=
-col gmail-gap-1 gmail-pl-8 gmail-mb-3"><li class=3D"gmail-font-claude-resp=
onse-body gmail-whitespace-normal gmail-break-words gmail-pl-2">0x80 (FORCE=
_BULK)</li><li class=3D"gmail-font-claude-response-body gmail-whitespace-no=
rmal gmail-break-words gmail-pl-2">0x83 (FORCE_BULK | FIX_BANDWIDTH | FIX_H=
D)</li></ul><p class=3D"gmail-font-claude-response-body gmail-break-words g=
mail-whitespace-normal">The failure is in the isochronous stream-start / SE=
T_INTERFACE path.</p><p class=3D"gmail-font-claude-response-body gmail-brea=
k-words gmail-whitespace-normal">Full lsusb -v descriptor dump and uvcvideo=
 trace log are attached. Happy to capture a usbmon trace or test patches on=
 request.</p><p class=3D"gmail-font-claude-response-body gmail-break-words =
gmail-whitespace-normal">Thanks,</p><p class=3D"gmail-font-claude-response-=
body gmail-break-words gmail-whitespace-normal"><span style=3D"background-c=
olor:transparent">Sid</span></p></div>

--0000000000001fd51906550d9ce0--
--0000000000001fd51a06550d9ce2
Content-Type: text/plain; charset="US-ASCII"; name="uvc-13d3-56bd-report.txt"
Content-Disposition: attachment; filename="uvc-13d3-56bd-report.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mqt35ubd2>
X-Attachment-Id: f_mqt35ubd2

VG86IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpTdWJqZWN0OiB1dmN2aWRlbzogZGV2aWNl
IHJlc2V0cyBvbiBzdHJlYW0gc3RhcnQgKFNFVF9JTlRFUkZBQ0UpIC0gQXp1cmV3YXZlIDEzZDM6
NTZiZCwgaXNvLW9ubHkKCkhhcmR3YXJlOiBBenVyZXdhdmUgLyBJTUMgTmV0d29ya3MgVVNCIENh
bWVyYSwgVklEOlBJRCAxM2QzOjU2YmQsIGJjZERldmljZSAyMC4wMS4KSW50ZXJuYWwgd2ViY2Ft
LCBSYXplciBCbGFkZSAxNSBBZHZhbmNlZCAoMjAyMSkuIEhpZ2gtU3BlZWQgKDQ4MCBNYnBzKSwg
YnVzLXBvd2VyZWQsClVWQyAxLjAwLgoKS2VybmVsOiA2LjE4LjM2IChOaXhPUyAyNi4wNSksIHV2
Y3ZpZGVvIDEuMS4xLgoKU3VtbWFyeToKClRoZSBjYW1lcmEgZW51bWVyYXRlcyBjb3JyZWN0bHkg
YW5kIGV4cG9zZXMgdmFsaWQgTUpQRUcgYW5kIFlVWVYgZm9ybWF0cywgYnV0IGV2ZXJ5CnN0cmVh
bSBzdGFydCBjYXVzZXMgdGhlIGRldmljZSB0byBkaXNjb25uZWN0IGFuZCByZS1lbnVtZXJhdGUg
b24gdGhlIFVTQiBidXMuIFN0cmVhbWluZwpuZXZlciBiZWdpbnM7IHVzZXJzcGFjZSByZXR1cm5z
ICJWSURJT0NfU1RSRUFNT046IFByb3RvY29sIGVycm9yIiBhY3Jvc3MgYWxsIHRvb2xzCihmZm1w
ZWcsIHY0bDItY3RsKS4KClJlcHJvZHVjdGlvbjoKCiAgICB2NGwyLWN0bCAtLWRldmljZT0vZGV2
L3ZpZGVvMCBcCiAgICAgIC0tc2V0LWZtdC12aWRlbz13aWR0aD0xNjAsaGVpZ2h0PTEyMCxwaXhl
bGZvcm1hdD1NSlBHIFwKICAgICAgLS1zdHJlYW0tbW1hcCAtLXN0cmVhbS1jb3VudD0xIC0tc3Ry
ZWFtLXRvPS90bXAvdC5qcGcgLS12ZXJib3NlCgpBbGwgaW9jdGxzIHRocm91Z2ggUUJVRiBzdWNj
ZWVkOyBTVFJFQU1PTiByZXR1cm5zIC0xLgoKT2JzZXJ2YXRpb25zOgoKMS4gRW51bWVyYXRpb24g
aXMgY2xlYW4gb24gZXZlcnkgYm9vdDsgZnVsbCBkZXNjcmlwdG9yIHJlYWQsIGNvcnJlY3Qgc3Ry
aW5ncy4KCjIuIEJ1ZmZlciBzZXR1cCBzdWNjZWVkczogUkVRQlVGUywgQ1JFQVRFX0JVRlMsIFFV
RVJZQlVGLCBRQlVGIGFsbCByZXR1cm4gT0suCgozLiB1dmN2aWRlbyB0cmFjZSAodHJhY2U9MHhm
ZmZmKSBzaG93cyBzdWNjZXNzZnVsIGZvcm1hdC9QUk9CRSBuZWdvdGlhdGlvbiwgdGhlbiB0aGUK
ICAgZGV2aWNlIGRpc2Nvbm5lY3RzIGF0IHN0cmVhbSBzdGFydC4gTm8gIlNldHRpbmcgYWx0ZXJu
YXRlIHNldHRpbmciIG9yIENPTU1JVAogICBjb21wbGV0aW9uIGlzIGxvZ2dlZCBiZWZvcmUgdGhl
ICJVU0IgZGlzY29ubmVjdCIgZXZlbnQgLSB0aGUgcmVzZXQgb2NjdXJzIGF0IG9yCiAgIGltbWVk
aWF0ZWx5IGJlZm9yZSB0aGUgU0VUX0lOVEVSRkFDRSB0byBhIG5vbi16ZXJvIHN0cmVhbWluZyBh
bHRzZXR0aW5nLCBiZWZvcmUgYW55CiAgIGlzb2Nocm9ub3VzIGRhdGEgZmxvd3MuCgo0LiBGYWls
dXJlIGlzIGluZGVwZW5kZW50IG9mIHJlc29sdXRpb24gLSAxNjB4MTIwIChzbWFsbGVzdCBhbHRz
ZXR0aW5nLCAxMjggQi9wYWNrZXQpCiAgIGZhaWxzIGlkZW50aWNhbGx5IHRvIDEyODB4NzIwLiBO
b3QgYSBiYW5kd2lkdGggY2VpbGluZy4KCjUuIFVTQiBhdXRvc3VzcGVuZCBzdGF0ZSBoYXMgbm8g
ZWZmZWN0IChwb3dlci9jb250cm9sPW9uLCB1bmNoYW5nZWQgYmVoYXZpb3IpLgoKRGVzY3JpcHRv
ciBub3RlOgoKSW50ZXJmYWNlIDEgKFZpZGVvU3RyZWFtaW5nKSBleHBvc2VzIGFsdGVybmF0ZSBz
ZXR0aW5ncyAwLTcsIGFsbCBpc29jaHJvbm91cyAoMTI4IEIgdXAKdG8gM3gxMDI0IEIgcGVyIG1p
Y3JvZnJhbWUpOyBhbHQgMCBpcyB0aGUgemVyby1iYW5kd2lkdGggaWRsZS4gVGhlcmUgaXMgbm8g
YnVsawpzdHJlYW1pbmcgZW5kcG9pbnQuIFVWQ19RVUlSS19GT1JDRV9CVUxLIGlzIHRoZXJlZm9y
ZSBzdHJ1Y3R1cmFsbHkgaW5hcHBsaWNhYmxlLiBRdWlya3MKdGVzdGVkLCBjb25maXJtZWQgYWN0
aXZlIGluIGRtZXNnLCBib3RoIGluZWZmZWN0aXZlOgoKICAtIDB4ODAgKEZPUkNFX0JVTEspCiAg
LSAweDgzIChGT1JDRV9CVUxLIHwgRklYX0JBTkRXSURUSCB8IEZJWF9IRCkKClRoZSBmYWlsdXJl
IGlzIGluIHRoZSBpc29jaHJvbm91cyBzdHJlYW0tc3RhcnQgLyBTRVRfSU5URVJGQUNFIHBhdGgu
CgpBdHRhY2hlZDogZnVsbCBsc3VzYiAtdiBkZXNjcmlwdG9yIGR1bXA7IHV2Y3ZpZGVvIHRyYWNl
IGxvZy4KCkhhcHB5IHRvIGNhcHR1cmUgYSB1c2Jtb24gdHJhY2Ugb3IgdGVzdCBwYXRjaGVzIG9u
IHJlcXVlc3QuCg==
--0000000000001fd51a06550d9ce2
Content-Type: text/plain; charset="US-ASCII"; name="uvc-streamon-trace.txt"
Content-Disposition: attachment; filename="uvc-streamon-trace.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mqt35uav0>
X-Attachment-Id: f_mqt35uav0

IyB1dmN2aWRlbyB0cmFjZSAodHJhY2U9MHhmZmZmKSwga2VybmVsIDYuMTguMzYsIGRldmljZSAx
M2QzOjU2YmQKIyBUcmFjZSBjYXB0dXJlZCBkdXJpbmc6IGZmbXBlZyAtZiB2NGwyIC1pbnB1dF9m
b3JtYXQgbWpwZWcgLXZpZGVvX3NpemUgMTYweDEyMCAtaSAvZGV2L3ZpZGVvMCAtZnJhbWVzOnYg
MSAvdG1wL3QuanBnCiMgTm90ZTogdHJhY2Ugc2hvd3MgZnVsbCBmb3JtYXQvUFJPQkUgbmVnb3Rp
YXRpb24sIHRoZW4gdXZjX3Y0bDJfcmVsZWFzZSwgdGhlbiB0aGUgZGV2aWNlCiMgaXMgc3VzcGVu
ZGVkL2Rpc2Nvbm5lY3RzIGF0IHN0cmVhbSBzdGFydC4gTm8gIlNldHRpbmcgYWx0ZXJuYXRlIHNl
dHRpbmciIG9yIENPTU1JVAojIGNvbXBsZXRpb24gaXMgbG9nZ2VkIGJlZm9yZSB0aGUgVVNCIGRp
c2Nvbm5lY3QuCgpbICA1OTEuMzU0NDY4XSB1dmN2aWRlbyAxLTc6MS4wOiBVc2luZyBkZWZhdWx0
IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbICA1OTEuMzU1ODQ0XSB1dmN2
aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQgKE1KUEcpOiAxNzZ4MTQ0Clsg
IDU5MS4zNTU4NDVdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2
YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zNTcwNzhdIHV2Y3ZpZGVvIDEtNzoxLjA6
IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0ZCAoTUpQRyk6IDMyMHgyNDAKWyAgNTkxLjM1NzA4MF0g
dXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyAgNTkxLjM1ODMxNV0gdXZjdmlkZW8gMS03OjEuMDogVHJ5aW5nIGZvcm1h
dCAweDQ3NTA0YTRkIChNSlBHKTogMzUyeDI4OApbICA1OTEuMzU4MzE2XSB1dmN2aWRlbyAxLTc6
MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpb
ICA1OTEuMzU5NjA5XSB1dmN2aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQg
KE1KUEcpOiA2NDB4NDgwClsgIDU5MS4zNTk2MTBdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRl
ZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zNjA4NDhd
IHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0ZCAoTUpQRyk6IDEyODB4
NzIwClsgIDU5MS4zNjA4NTBdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUg
aW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zNjIxNDVdIHV2Y3ZpZGVvIDEt
NzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDEyODB4NzIwClsgIDU5MS4z
NjIxNDddIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTAw
MDAwLjAgdXMgKDEwLjAgZnBzKQpbICA1OTEuMzYzNDg4XSB1dmN2aWRlbyAxLTc6MS4wOiBUcnlp
bmcgZm9ybWF0IDB4NTY1OTU1NTkgKFlVWVYpOiAxNjB4MTIwClsgIDU5MS4zNjM0OTBdIHV2Y3Zp
ZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAu
MCBmcHMpClsgIDU5MS4zNjQ3OTRdIHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1
NjU5NTU1OSAoWVVZVik6IDE3NngxNDQKWyAgNTkxLjM2NDc5NV0gdXZjdmlkZW8gMS03OjEuMDog
VXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyAgNTkx
LjM2NjAzN10gdXZjdmlkZW8gMS03OjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlW
KTogMzIweDI0MApbICA1OTEuMzY2MDM4XSB1dmN2aWRlbyAxLTc6MS4wOiBVc2luZyBkZWZhdWx0
IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbICA1OTEuMzY3MjY1XSB1dmN2
aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NTY1OTU1NTkgKFlVWVYpOiAzNTJ4Mjg4Clsg
IDU5MS4zNjcyNjZdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2
YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zNjg1NTRdIHV2Y3ZpZGVvIDEtNzoxLjA6
IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDY0MHg0ODAKWyAgNTkxLjM2ODU1NV0g
dXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyAgNTkxLjM2OTg2MV0gdXZjdmlkZW8gMS03OjEuMDogVHJ5aW5nIGZvcm1h
dCAweDU2NTk1NTU5IChZVVlWKTogMTI4MHg3MjAKWyAgNTkxLjM2OTg2M10gdXZjdmlkZW8gMS03
OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAxMDAwMDAuMCB1cyAoMTAuMCBmcHMp
ClsgIDU5MS4zNzEyODJdIHV2Y3ZpZGVvIDEtNzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyAgNTkx
LjM3MTY1Nl0gdXZjdmlkZW8gMS03OjEuMDogdXZjX3Y0bDJfb3BlbgpbICA1OTEuMzczMjMxXSB1
dmN2aWRlbyAxLTc6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgIDU5MS4zNzMyMzldIHV2Y3ZpZGVv
IDEtNzoxLjA6IHV2Y192NGwyX29wZW4KWyAgNTkxLjM3MzI0OV0gdXZjdmlkZW8gMS03OjEuMDog
VHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTI4MHg3MjAKWyAgNTkxLjM3MzI1MF0g
dXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyAgNTkxLjM3NDU1MF0gdXZjdmlkZW8gMS03OjEuMDogVHJ5aW5nIGZvcm1h
dCAweDQ3NTA0YTRkIChNSlBHKTogMTYweDEyMApbICA1OTEuMzc0NTUyXSB1dmN2aWRlbyAxLTc6
MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpb
ICA1OTEuMzc1Nzk4XSB1dmN2aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQg
KE1KUEcpOiAxNzZ4MTQ0ClsgIDU5MS4zNzU4MDBdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRl
ZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zNzcwNzld
IHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0ZCAoTUpQRyk6IDMyMHgy
NDAKWyAgNTkxLjM3NzA4MV0gdXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBp
bnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyAgNTkxLjM3ODM0OF0gdXZjdmlkZW8gMS03
OjEuMDogVHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMzUyeDI4OApbICA1OTEuMzc4
MzQ5XSB1dmN2aWRlbyAxLTc6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMz
LjMgdXMgKDMwLjAgZnBzKQpbICA1OTEuMzc5NjMxXSB1dmN2aWRlbyAxLTc6MS4wOiBUcnlpbmcg
Zm9ybWF0IDB4NDc1MDRhNGQgKE1KUEcpOiA2NDB4NDgwClsgIDU5MS4zNzk2MzNdIHV2Y3ZpZGVv
IDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBm
cHMpClsgIDU5MS4zODA5MTFdIHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUw
NGE0ZCAoTUpQRyk6IDEyODB4NzIwClsgIDU5MS4zODA5MTJdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVz
aW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4z
ODIxNTRdIHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6
IDEyODB4NzIwClsgIDU5MS4zODIxNTVdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQg
ZnJhbWUgaW50ZXJ2YWwgMTAwMDAwLjAgdXMgKDEwLjAgZnBzKQpbICA1OTEuMzgzNTA1XSB1dmN2
aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NTY1OTU1NTkgKFlVWVYpOiAxNjB4MTIwClsg
IDU5MS4zODM1MDZdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2
YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zODQ4NTldIHV2Y3ZpZGVvIDEtNzoxLjA6
IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDE3NngxNDQKWyAgNTkxLjM4NDg2MV0g
dXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyAgNTkxLjM4NjE5OV0gdXZjdmlkZW8gMS03OjEuMDogVHJ5aW5nIGZvcm1h
dCAweDU2NTk1NTU5IChZVVlWKTogMzIweDI0MApbICA1OTEuMzg2MjAwXSB1dmN2aWRlbyAxLTc6
MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpb
ICA1OTEuMzg3NTA0XSB1dmN2aWRlbyAxLTc6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NTY1OTU1NTkg
KFlVWVYpOiAzNTJ4Mjg4ClsgIDU5MS4zODc1MDZdIHV2Y3ZpZGVvIDEtNzoxLjA6IFVzaW5nIGRl
ZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgIDU5MS4zODg3NDVd
IHV2Y3ZpZGVvIDEtNzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDY0MHg0
ODAKWyAgNTkxLjM4ODc0Nl0gdXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBp
bnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyAgNTkxLjM4OTk4NF0gdXZjdmlkZW8gMS03
OjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlWKTogMTI4MHg3MjAKWyAgNTkxLjM4
OTk4Nl0gdXZjdmlkZW8gMS03OjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAxMDAw
MDAuMCB1cyAoMTAuMCBmcHMpClsgIDU5MS4zOTEzMDZdIHV2Y3ZpZGVvIDEtNzoxLjA6IHV2Y192
NGwyX3JlbGVhc2UKWyAgNTkzLjg1ODAxN10gdXZjdmlkZW8gMS03OjEuMDogU3VzcGVuZGluZyBp
bnRlcmZhY2UgMQpbICA1OTMuODU4MDMwXSB1dmN2aWRlbyAxLTc6MS4wOiBTdXNwZW5kaW5nIGlu
dGVyZmFjZSAwCgojIERpc2Nvbm5lY3QvcmUtZW51bWVyYXRlIHNlcXVlbmNlIChzZXBhcmF0ZSBj
bGVhcmVkLWJ1ZmZlciBjYXB0dXJlLCBncmVwLWZpbHRlcmVkKToKWyAgODAzLjQ2MjE1NF0gdXNi
IDEtNzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgNwpbICA4MDMuNDY3NjU4XSB1c2Ig
MS03OjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbICA4MDMuNzg5NzQ2XSB1c2IgMS03OiBuZXcgaGln
aC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA4IHVzaW5nIHhoY2lfaGNkClsgIDgwMy45NDE3OTBd
IHVzYiAxLTc6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0xM2QzLCBpZFByb2R1Y3Q9
NTZiZCwgYmNkRGV2aWNlPTIwLjAxClsgIDgwMy45NDE4MDVdIHVzYiAxLTc6IE5ldyBVU0IgZGV2
aWNlIHN0cmluZ3M6IE1mcj0zLCBQcm9kdWN0PTEsIFNlcmlhbE51bWJlcj0yClsgIDgwMy45NDE4
MTBdIHVzYiAxLTc6IFByb2R1Y3Q6IFVTQiBDYW1lcmEKWyAgODAzLjk0MTgxNF0gdXNiIDEtNzog
TWFudWZhY3R1cmVyOiBBenVyZXdhdmUKWyAgODAzLjk0MTgxOF0gdXNiIDEtNzogU2VyaWFsTnVt
YmVyOiAweDAwMDEK
--0000000000001fd51a06550d9ce2
Content-Type: text/plain; charset="US-ASCII"; name="lsusb-13d3-56bd.txt"
Content-Disposition: attachment; filename="lsusb-13d3-56bd.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mqt35ub71>
X-Attachment-Id: f_mqt35ub71

QnVzIDAwMSBEZXZpY2UgMDA2OiBJRCAxM2QzOjU2YmQgSU1DIE5ldHdvcmtzIFVTQiBDYW1lcmEK
TmVnb3RpYXRlZCBzcGVlZDogSGlnaCBTcGVlZCAoNDgwTWJwcykKRGV2aWNlIERlc2NyaXB0b3I6
CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAxOAogIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDEK
ICBiY2RVU0IgICAgICAgICAgICAgICAyLjAxCiAgYkRldmljZUNsYXNzICAgICAgICAgIDIzOSBN
aXNjZWxsYW5lb3VzIERldmljZQogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDIgW3Vua25vd25d
CiAgYkRldmljZVByb3RvY29sICAgICAgICAgMSBJbnRlcmZhY2UgQXNzb2NpYXRpb24KICBiTWF4
UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MTNkMyBJTUMgTmV0
d29ya3MKICBpZFByb2R1Y3QgICAgICAgICAgMHg1NmJkIFVTQiBDYW1lcmEKICBiY2REZXZpY2Ug
ICAgICAgICAgIDIwLjAxCiAgaU1hbnVmYWN0dXJlciAgICAgICAgICAgMyBBenVyZXdhdmUKICBp
UHJvZHVjdCAgICAgICAgICAgICAgICAxIFVTQiBDYW1lcmEKICBpU2VyaWFsICAgICAgICAgICAg
ICAgICAyIDB4MDAwMQogIGJOdW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBDb25maWd1cmF0aW9u
IERlc2NyaXB0b3I6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMmVmCiAgICBiTnVtSW50
ZXJmYWNlcyAgICAgICAgICAyCiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAgICAxCiAgICBpQ29u
ZmlndXJhdGlvbiAgICAgICAgICA0IFVTQiBDYW1lcmEKICAgIGJtQXR0cmlidXRlcyAgICAgICAg
IDB4ODAKICAgICAgKEJ1cyBQb3dlcmVkKQogICAgTWF4UG93ZXIgICAgICAgICAgICAgIDUwMG1B
CiAgICBJbnRlcmZhY2UgQXNzb2NpYXRpb246CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAg
IDgKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAxMQogICAgICBiRmlyc3RJbnRlcmZhY2Ug
ICAgICAgICAwCiAgICAgIGJJbnRlcmZhY2VDb3VudCAgICAgICAgIDIKICAgICAgYkZ1bmN0aW9u
Q2xhc3MgICAgICAgICAxNCBWaWRlbwogICAgICBiRnVuY3Rpb25TdWJDbGFzcyAgICAgICAzIFZp
ZGVvIEludGVyZmFjZSBDb2xsZWN0aW9uCiAgICAgIGJGdW5jdGlvblByb3RvY29sICAgICAgIDAK
ICAgICAgaUZ1bmN0aW9uICAgICAgICAgICAgICAgNSBVU0IgQ2FtZXJhCiAgICBJbnRlcmZhY2Ug
RGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAg
YkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAx
CiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAgMTQgVmlkZW8KICAgICAgYkludGVyZmFjZVN1
YkNsYXNzICAgICAgMSBWaWRlbyBDb250cm9sCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAg
IDAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgNSBVU0IgQ2FtZXJhCiAgICAgIFZpZGVv
Q29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAg
ICAgIDEzCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlw
dG9yU3VidHlwZSAgICAgIDEgKEhFQURFUikKICAgICAgICBiY2RVVkMgICAgICAgICAgICAgICAx
LjAwCiAgICAgICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDA2YgogICAgICAgIGR3Q2xvY2tGcmVx
dWVuY3kgICAgICAgMTUuMDAwMDAwTUh6CiAgICAgICAgYkluQ29sbGVjdGlvbiAgICAgICAgICAg
MQogICAgICAgIGJhSW50ZXJmYWNlTnIoIDApICAgICAgIDEKICAgICAgVmlkZW9Db250cm9sIElu
dGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgMTgKICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBl
ICAgICAgMiAoSU5QVVRfVEVSTUlOQUwpCiAgICAgICAgYlRlcm1pbmFsSUQgICAgICAgICAgICAg
MQogICAgICAgIHdUZXJtaW5hbFR5cGUgICAgICAweDAyMDEgQ2FtZXJhIFNlbnNvcgogICAgICAg
IGJBc3NvY1Rlcm1pbmFsICAgICAgICAgIDAKICAgICAgICBpVGVybWluYWwgICAgICAgICAgICAg
ICAwCiAgICAgICAgd09iamVjdGl2ZUZvY2FsTGVuZ3RoTWluICAgICAgMAogICAgICAgIHdPYmpl
Y3RpdmVGb2NhbExlbmd0aE1heCAgICAgIDAKICAgICAgICB3T2N1bGFyRm9jYWxMZW5ndGggICAg
ICAgICAgICAwCiAgICAgICAgYkNvbnRyb2xTaXplICAgICAgICAgICAgICAgICAgMwogICAgICAg
IGJtQ29udHJvbHMgICAgICAgICAgIDB4MDAwMDAwMDQKICAgICAgICAgIEF1dG8tRXhwb3N1cmUg
UHJpb3JpdHkKICAgICAgVmlkZW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgMTEKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
IDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgNSAoUFJPQ0VTU0lOR19VTklUKQog
ICAgICBXYXJuaW5nOiBEZXNjcmlwdG9yIHRvbyBzaG9ydAogICAgICAgIGJVbml0SUQgICAgICAg
ICAgICAgICAgIDIKICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgICAxCiAgICAgICAgd01h
eE11bHRpcGxpZXIgICAgICAgICAgMAogICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAgIDIK
ICAgICAgICBibUNvbnRyb2xzICAgICAweDAwMDAxNzdmCiAgICAgICAgICBCcmlnaHRuZXNzCiAg
ICAgICAgICBDb250cmFzdAogICAgICAgICAgSHVlCiAgICAgICAgICBTYXR1cmF0aW9uCiAgICAg
ICAgICBTaGFycG5lc3MKICAgICAgICAgIEdhbW1hCiAgICAgICAgICBXaGl0ZSBCYWxhbmNlIFRl
bXBlcmF0dXJlCiAgICAgICAgICBCYWNrbGlnaHQgQ29tcGVuc2F0aW9uCiAgICAgICAgICBHYWlu
CiAgICAgICAgICBQb3dlciBMaW5lIEZyZXF1ZW5jeQogICAgICAgICAgV2hpdGUgQmFsYW5jZSBU
ZW1wZXJhdHVyZSwgQXV0bwogICAgICAgIGlQcm9jZXNzaW5nICAgICAgICAgICAgIDAKICAgICAg
ICBibVZpZGVvU3RhbmRhcmRzICAgICAweDA5CiAgICAgICAgICBOb25lCiAgICAgICAgICBTRUNB
TSAtIDYyNS81MAogICAgICBWaWRlb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAg
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAzIChPVVRQVVRfVEVSTUlOQUwp
CiAgICAgICAgYlRlcm1pbmFsSUQgICAgICAgICAgICAgMwogICAgICAgIHdUZXJtaW5hbFR5cGUg
ICAgICAweDAxMDEgVVNCIFN0cmVhbWluZwogICAgICAgIGJBc3NvY1Rlcm1pbmFsICAgICAgICAg
IDAKICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgICA2CiAgICAgICAgaVRlcm1pbmFsICAg
ICAgICAgICAgICAgMAogICAgICBWaWRlb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAg
ICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAyNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAg
ICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICA2IChFWFRFTlNJT05fVU5J
VCkKICAgICAgICBiVW5pdElEICAgICAgICAgICAgICAgICA0CiAgICAgICAgZ3VpZEV4dGVuc2lv
bkNvZGUgICAgICAgICB7MTIyOWE3OGMtNDdiNC00MDk0LWIwY2UtZGIwNzM4NmZiOTM4fQogICAg
ICAgIGJOdW1Db250cm9scyAgICAgICAgICAgIDIKICAgICAgICBiTnJJblBpbnMgICAgICAgICAg
ICAgICAxCiAgICAgICAgYmFTb3VyY2VJRCggMCkgICAgICAgICAgMgogICAgICAgIGJDb250cm9s
U2l6ZSAgICAgICAgICAgIDIKICAgICAgICBibUNvbnRyb2xzKCAwKSAgICAgICAweDAwCiAgICAg
ICAgYm1Db250cm9scyggMSkgICAgICAgMHgwNgogICAgICAgIGlFeHRlbnNpb24gICAgICAgICAg
ICAgIDAKICAgICAgVmlkZW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJM
ZW5ndGggICAgICAgICAgICAgICAgMjkKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2
CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgNiAoRVhURU5TSU9OX1VOSVQpCiAgICAg
ICAgYlVuaXRJRCAgICAgICAgICAgICAgICAgNgogICAgICAgIGd1aWRFeHRlbnNpb25Db2RlICAg
ICAgICAgezI2YjgxMDVhLTA3MTMtNDg3MC05NzlkLWRhNzk0NDRiYjY4ZX0KICAgICAgICBiTnVt
Q29udHJvbHMgICAgICAgICAgICAxCiAgICAgICAgYk5ySW5QaW5zICAgICAgICAgICAgICAgMQog
ICAgICAgIGJhU291cmNlSUQoIDApICAgICAgICAgIDQKICAgICAgICBiQ29udHJvbFNpemUgICAg
ICAgICAgICA0CiAgICAgICAgYm1Db250cm9scyggMCkgICAgICAgMHgwNAogICAgICAgIGJtQ29u
dHJvbHMoIDEpICAgICAgIDB4MDAKICAgICAgICBibUNvbnRyb2xzKCAyKSAgICAgICAweDAwCiAg
ICAgICAgYm1Db250cm9scyggMykgICAgICAgMHgwMAogICAgICAgIGlFeHRlbnNpb24gICAgICAg
ICAgICAgIDcgKGVycm9yKQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5n
dGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAg
ICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MyAgRVAgMyBJTgogICAgICAgIGJtQXR0cmli
dXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRl
cnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBV
c2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAw
eDAwMTAgIDF4IDE2IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgNgogICAg
ICAgIFZpZGVvQ29udHJvbCBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgICAgYkxlbmd0aCAg
ICAgICAgICAgICAgICAgNQogICAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNwogICAg
ICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMyAoRVBfSU5URVJSVVBUKQogICAgICAgICAg
d01heFRyYW5zZmVyU2l6ZSAgICAgICAxNgogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAg
NAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5n
ICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMAogICAgICBiSW50ZXJmYWNl
Q2xhc3MgICAgICAgIDE0IFZpZGVvCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgVmlk
ZW8gU3RyZWFtaW5nCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAKICAgICAgaUludGVy
ZmFjZSAgICAgICAgICAgICAgMAogICAgICBWaWRlb1N0cmVhbWluZyBJbnRlcmZhY2UgRGVzY3Jp
cHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE1CiAgICAg
ICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgICAgICAgICAgICAzNgogICAgICAgIGJEZXNjcmlw
dG9yU3VidHlwZSAgICAgICAgICAgICAgICAgIDEgKElOUFVUX0hFQURFUikKICAgICAgICBiTnVt
Rm9ybWF0cyAgICAgICAgICAgICAgICAgICAgICAgICAyCiAgICAgICAgd1RvdGFsTGVuZ3RoICAg
ICAgICAgICAgICAgICAgIDB4MDFlNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgICAgICAg
ICAgICAgIDB4ODEgIEVQIDEgSU4KICAgICAgICBibUluZm8gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwCiAgICAgICAgYlRlcm1pbmFsTGluayAgICAgICAgICAgICAgICAgICAgICAgMwog
ICAgICAgIGJTdGlsbENhcHR1cmVNZXRob2QgICAgICAgICAgICAgICAgIDEKICAgICAgICBiVHJp
Z2dlclN1cHBvcnQgICAgICAgICAgICAgICAgICAgICAxCiAgICAgICAgYlRyaWdnZXJVc2FnZSAg
ICAgICAgICAgICAgICAgICAgICAgMAogICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAgICAg
ICAgICAgICAgIDEKICAgICAgICBibWFDb250cm9scyggMCkgICAgICAgICAgICAgICAgICAgICAw
CiAgICAgICAgYm1hQ29udHJvbHMoIDEpICAgICAgICAgICAgICAgICAgICAgMAogICAgICBWaWRl
b1N0cmVhbWluZyBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDExCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgICAg
ICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgICAgICAgICAgICAgIDYg
KEZPUk1BVF9NSlBFRykKICAgICAgICBiRm9ybWF0SW5kZXggICAgICAgICAgICAgICAgICAgICAg
ICAxCiAgICAgICAgYk51bUZyYW1lRGVzY3JpcHRvcnMgICAgICAgICAgICAgICAgNwogICAgICAg
IGJGbGFncyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEKICAgICAgICAgIEZpeGVkLXNp
emUgc2FtcGxlczogWWVzCiAgICAgICAgYkRlZmF1bHRGcmFtZUluZGV4ICAgICAgICAgICAgICAg
ICAgMQogICAgICAgIGJBc3BlY3RSYXRpb1ggICAgICAgICAgICAgICAgICAgICAgIDAKICAgICAg
ICBiQXNwZWN0UmF0aW9ZICAgICAgICAgICAgICAgICAgICAgICAwCiAgICAgICAgYm1JbnRlcmxh
Y2VGbGFncyAgICAgICAgICAgICAgICAgMHgwMAogICAgICAgICAgSW50ZXJsYWNlZCBzdHJlYW0g
b3IgdmFyaWFibGU6IE5vCiAgICAgICAgICBGaWVsZHMgcGVyIGZyYW1lOiAxIGZpZWxkcwogICAg
ICAgICAgRmllbGQgMSBmaXJzdDogTm8KICAgICAgICAgIEZpZWxkIHBhdHRlcm46IEZpZWxkIDEg
b25seQogICAgICAgIGJDb3B5UHJvdGVjdCAgICAgICAgICAgICAgICAgICAgICAgIDAKICAgICAg
W01KUEVHIEZSQU1FIGRlc2NyaXB0b3JzLCBiRnJhbWVJbmRleCAxLTc6XQogICAgICAgIDE6IDEy
ODB4NzIwICAgbWluQml0UmF0ZSA0NDIzNjgwMDAgICBtYXhGcmFtZUJ1ZmZlciAxODQzMjAwICAg
aW50ZXJ2YWwgMzMzMzMzICgzMGZwcykKICAgICAgICAyOiAgMTYweDEyMCAgIG1pbkJpdFJhdGUg
ICA5MjE2MDAwICAgbWF4RnJhbWVCdWZmZXIgICAzODQwMCAgIGludGVydmFsIDMzMzMzMyAoMzBm
cHMpCiAgICAgICAgMzogIDE3NngxNDQgICBtaW5CaXRSYXRlICAxMjE2NTEyMCAgIG1heEZyYW1l
QnVmZmVyICAgNTA2ODggICBpbnRlcnZhbCAzMzMzMzMgKDMwZnBzKQogICAgICAgIDQ6ICAzMjB4
MjQwICAgbWluQml0UmF0ZSAgMzY4NjQwMDAgICBtYXhGcmFtZUJ1ZmZlciAgMTUzNjAwICAgaW50
ZXJ2YWwgMzMzMzMzICgzMGZwcykKICAgICAgICA1OiAgMzUyeDI4OCAgIG1pbkJpdFJhdGUgIDQ4
NjYwNDgwICAgbWF4RnJhbWVCdWZmZXIgIDIwMjc1MiAgIGludGVydmFsIDMzMzMzMyAoMzBmcHMp
CiAgICAgICAgNjogIDY0MHg0ODAgICBtaW5CaXRSYXRlIDE0NzQ1NjAwMCAgIG1heEZyYW1lQnVm
ZmVyICA2MTQ0MDAgICBpbnRlcnZhbCAzMzMzMzMgKDMwZnBzKQogICAgICAgIDc6IDEyODB4NzIw
ICAgbWluQml0UmF0ZSA0NDIzNjgwMDAgICBtYXhGcmFtZUJ1ZmZlciAxODQzMjAwICAgaW50ZXJ2
YWwgMzMzMzMzICgzMGZwcykKICAgICAgVmlkZW9TdHJlYW1pbmcgSW50ZXJmYWNlIERlc2NyaXB0
b3I6CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgICAgICAgICAgICAxMyAoQ09MT1JG
T1JNQVQpCiAgICAgICAgYkNvbG9yUHJpbWFyaWVzICAgICAgICAgICAgICAgICAgICAgMSAoQlQu
NzA5LHNSR0IpCiAgICAgICAgYlRyYW5zZmVyQ2hhcmFjdGVyaXN0aWNzICAgICAgICAgICAgMSAo
QlQuNzA5KQogICAgICAgIGJNYXRyaXhDb2VmZmljaWVudHMgICAgICAgICAgICAgICAgIDQgKFNN
UFRFIDE3ME0gKEJULjYwMSkpCiAgICAgIFZpZGVvU3RyZWFtaW5nIEludGVyZmFjZSBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgICAgICAgICAgICAgMjcKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICAgICAgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0
b3JTdWJ0eXBlICAgICAgICAgICAgICAgICAgNCAoRk9STUFUX1VOQ09NUFJFU1NFRCkKICAgICAg
ICBiRm9ybWF0SW5kZXggICAgICAgICAgICAgICAgICAgICAgICAyCiAgICAgICAgYk51bUZyYW1l
RGVzY3JpcHRvcnMgICAgICAgICAgICAgICAgNwogICAgICAgIGd1aWRGb3JtYXQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgezMyNTk1NTU5LTAwMDAtMDAxMC04MDAwLTAwYWEwMDM4OWI3MX0g
KFlVWTIpCiAgICAgICAgYkJpdHNQZXJQaXhlbCAgICAgICAgICAgICAgICAgICAgICAxNgogICAg
ICAgIGJEZWZhdWx0RnJhbWVJbmRleCAgICAgICAgICAgICAgICAgIDEKICAgICAgICBiQXNwZWN0
UmF0aW9YICAgICAgICAgICAgICAgICAgICAgICAwCiAgICAgICAgYkFzcGVjdFJhdGlvWSAgICAg
ICAgICAgICAgICAgICAgICAgMAogICAgICAgIGJtSW50ZXJsYWNlRmxhZ3MgICAgICAgICAgICAg
ICAgIDB4MDAKICAgICAgICBiQ29weVByb3RlY3QgICAgICAgICAgICAgICAgICAgICAgICAwCiAg
ICAgIFtZVVlWL1VOQ09NUFJFU1NFRCBGUkFNRSBkZXNjcmlwdG9ycywgYkZyYW1lSW5kZXggMS03
Ol0KICAgICAgICAxOiAxMjgweDcyMCAgIG1pbkJpdFJhdGUgMTQ3NDU2MDAwICAgbWF4RnJhbWVC
dWZmZXIgMTg0MzIwMCAgIGludGVydmFsIDEwMDAwMDAgKDEwZnBzKQogICAgICAgIDI6ICAxNjB4
MTIwICAgbWluQml0UmF0ZSAgIDkyMTYwMDAgICBtYXhGcmFtZUJ1ZmZlciAgIDM4NDAwICAgaW50
ZXJ2YWwgIDMzMzMzMyAoMzBmcHMpCiAgICAgICAgMzogIDE3NngxNDQgICBtaW5CaXRSYXRlICAx
MjE2NTEyMCAgIG1heEZyYW1lQnVmZmVyICAgNTA2ODggICBpbnRlcnZhbCAgMzMzMzMzICgzMGZw
cykKICAgICAgICA0OiAgMzIweDI0MCAgIG1pbkJpdFJhdGUgIDM2ODY0MDAwICAgbWF4RnJhbWVC
dWZmZXIgIDE1MzYwMCAgIGludGVydmFsICAzMzMzMzMgKDMwZnBzKQogICAgICAgIDU6ICAzNTJ4
Mjg4ICAgbWluQml0UmF0ZSAgNDg2NjA0ODAgICBtYXhGcmFtZUJ1ZmZlciAgMjAyNzUyICAgaW50
ZXJ2YWwgIDMzMzMzMyAoMzBmcHMpCiAgICAgICAgNjogIDY0MHg0ODAgICBtaW5CaXRSYXRlIDE0
NzQ1NjAwMCAgIG1heEZyYW1lQnVmZmVyICA2MTQ0MDAgICBpbnRlcnZhbCAgMzMzMzMzICgzMGZw
cykKICAgICAgICA3OiAxMjgweDcyMCAgIG1pbkJpdFJhdGUgMTQ3NDU2MDAwICAgbWF4RnJhbWVC
dWZmZXIgMTg0MzIwMCAgIGludGVydmFsIDEwMDAwMDAgKDEwZnBzKQogICAgICBWaWRlb1N0cmVh
bWluZyBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAg
ICAgICAgICAgICAgIDEzIChDT0xPUkZPUk1BVCkKICAgICAgICBiQ29sb3JQcmltYXJpZXMgICAg
ICAgICAgICAgICAgICAgICAxIChCVC43MDksc1JHQikKICAgICAgICBiVHJhbnNmZXJDaGFyYWN0
ZXJpc3RpY3MgICAgICAgICAgICAxIChCVC43MDkpCiAgICAgICAgYk1hdHJpeENvZWZmaWNpZW50
cyAgICAgICAgICAgICAgICAgNCAoU01QVEUgMTcwTSAoQlQuNjAxKSkKCiAgICAtLS0gSW50ZXJm
YWNlIDEsIHN0cmVhbWluZyBhbHRlcm5hdGUgc2V0dGluZ3MgKEFMTCBJU09DSFJPTk9VUywgRVAg
MHg4MSBJTiwgYkludGVydmFsIDEpIC0tLQogICAgQWx0U2V0dGluZyAwOiBiTnVtRW5kcG9pbnRz
IDAgICh6ZXJvLWJhbmR3aWR0aCBpZGxlLCBubyBlbmRwb2ludCkKICAgIEFsdFNldHRpbmcgMTog
d01heFBhY2tldFNpemUgMHgwMDgwICAxeCAgMTI4IGJ5dGVzCiAgICBBbHRTZXR0aW5nIDI6IHdN
YXhQYWNrZXRTaXplIDB4MDIwMCAgMXggIDUxMiBieXRlcwogICAgQWx0U2V0dGluZyAzOiB3TWF4
UGFja2V0U2l6ZSAweDA0MDAgIDF4IDEwMjQgYnl0ZXMKICAgIEFsdFNldHRpbmcgNDogd01heFBh
Y2tldFNpemUgMHgwYjAwICAyeCAgNzY4IGJ5dGVzCiAgICBBbHRTZXR0aW5nIDU6IHdNYXhQYWNr
ZXRTaXplIDB4MGMwMCAgMnggMTAyNCBieXRlcwogICAgQWx0U2V0dGluZyA2OiB3TWF4UGFja2V0
U2l6ZSAweDEzODAgIDN4ICA4OTYgYnl0ZXMKICAgIEFsdFNldHRpbmcgNzogd01heFBhY2tldFNp
emUgMHgxNDAwICAzeCAxMDI0IGJ5dGVzCiAgICAoTm8gYnVsayBzdHJlYW1pbmcgZW5kcG9pbnQg
ZXhpc3RzIG9uIGFueSBhbHRlcm5hdGUgc2V0dGluZy4pCgpCaW5hcnkgT2JqZWN0IFN0b3JlIERl
c2NyaXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNQogIGJEZXNjcmlwdG9yVHlwZSAg
ICAgICAgMTUKICB3VG90YWxMZW5ndGggICAgICAgMHgwMDIxCiAgYk51bURldmljZUNhcHMgICAg
ICAgICAgMQogIFBsYXRmb3JtIERldmljZSBDYXBhYmlsaXR5OgogICAgYkxlbmd0aCAgICAgICAg
ICAgICAgICAyOAogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAxNgogICAgYkRldkNhcGFiaWxp
dHlUeXBlICAgICAgNQogICAgUGxhdGZvcm1DYXBhYmlsaXR5VVVJRCAgICB7ZDhkZDYwZGYtNDU4
OS00Y2M3LTljZDItNjU5ZDllNjQ4YTlmfQpEZXZpY2UgU3RhdHVzOiAgICAgMHgwMDAwCiAgKEJ1
cyBQb3dlcmVkKQo=
--0000000000001fd51a06550d9ce2--

