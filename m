Return-Path: <linux-media+bounces-62007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCmYCZAiC2oxDwUAu9opvQ
	(envelope-from <linux-media+bounces-62007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:30:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCE56ECFB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC8B830B421C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD0948C3EA;
	Mon, 18 May 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFFlDTVm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD5480954
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114217; cv=pass; b=QnL2WZyOvc31wrrevVuLwvkC3ICqyIO3dtexPurznitse0LD8FY3pPi9Owg3dICj1EJ5eaOchEVSALZG9U1UErH5+m1SoeAorm+xawdtFKieTfFg1OeqzgfzyG32+4jwJGgoa5aOZbN8GPWBG5y/HT6l76Yx6jV8Thou+5VV0K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114217; c=relaxed/simple;
	bh=4JIuMsbN3a19KOWRkuf+D7SsPdFNmcCHXj2yFHaqtUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNjTmmNLeUn4dWbVASHu/C5IpzChNsUrK7cIPgxB1BSIr3fcMsmdvF/C69o9/+5jeF2e2vjKpwR554Dq0lllrMAXIHmr3tq4SFgsw7R/t9YJYxBd9eWcz4XICDLe0t8XxEYXHUCHGH8X0d8tjgDEyxQTpyZhUhT7f6IOwO7b7Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFFlDTVm; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c87f1f8c8so121949c88.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779114211; cv=none;
        d=google.com; s=arc-20240605;
        b=fIF/k9I2bC7zhvDr1WHXf6tlHzLuRHqDEorop8oQR7yA49TOBXeOaZ/hpzlrfLn7xz
         AYHKim8jWR50CzOMpS6+0EawIma+Xz3No5UfAF2hL3OKaEt8tNsvhGGBPGhh3HohGjN8
         MskytpEvXj1o7waXVCMpBnbVHn7Tp/AMD6UmRy86CNT0ZSV1ZTazKDpois8YjAbd0B6H
         JeCcTlbFPL0tcRiKPcRNXRm5Pxik3gUKADTIZYClN/1skAqVlqnqjr4n8zei8CvdioT6
         qJBYNXWgDQyRB/kwnaXPquDmASNPBaLkEYas81EKPMbT68A+YzrllVA2qBnSdfpwskFb
         hRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6W+8Ad/Vtfal8Be2r/swqERUNXyi4XnkwGbJNcr36fc=;
        fh=041D8dqs4D8U48FNS95TbLWvDum8vZQlAlzQbkiS64s=;
        b=BhTH4OcwlY9sv/jQBMzUPnYdVL1Z+G/rcMdLFHmjSCTsNqM7OS3ixJFMjv6MEEcT7a
         TISZqzcQ5t3EMEkhKh5x1KSK85qUP2hXoB5heW1AGXyO50B7ujbwGYfgJT9GntbsfTDp
         8WlajOFf75rlCaQuVhr09M162Plo5o00scuegmtyg5WD3l2IRtaEbl+0j55avvWdX2qu
         jcIDZn6c1lhwzh/fmgpdzlBNNz3j/PqpT1zu4ORWY/Gk4LRNJEtUHqWwyB/AeXwPM+Pe
         LgK2dzI01RAikEp6GMJO/1w36FwD17wAB57Vrl+U9CHpfoh+iCfAVWuNwuYULbVgZkn2
         VWoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114211; x=1779719011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W+8Ad/Vtfal8Be2r/swqERUNXyi4XnkwGbJNcr36fc=;
        b=LFFlDTVmwYPNLHsD8JAH5SPSwKg37WQznwedIht211jOJpx0sJsXjQ1KKmWCDBivRO
         xgpYTE7gqYxLdvnduGL2sNV6fKAq+h76E46gntVdxy00qTR/Bt9XIooDEm/ieuil5CK9
         8nGgymt2B1ZyGGcoDtk4zPnqKmtgS8NVfyYkLYXu7bcWM/hHxs8qjNhPcgSmu1McQnwv
         uck/LB4tilfrlWqlMBW1lIqXRwhG0pN/PFToddDNtsHVN01FQBT3evxqPqP1iH+zHG9K
         jTTlsOC6T2Us7B08cokshDqqCtGu+nj/qf1jIbWno+du1VSxPxNGhNJ2rYCWi+6NjqQy
         +OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114211; x=1779719011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6W+8Ad/Vtfal8Be2r/swqERUNXyi4XnkwGbJNcr36fc=;
        b=OgH9YK9VCrFsKJD6tycsHlP7epdJ6wMwbINVOGgY3vFMCGf7ZvRF0pmdxg1pYQ4KMw
         vZrct+4OzHngTd/CWk6nzCOY/BKR9pH4u5M6x+KWeTinJMCMvd6KBf1podyUxP40kiJA
         HjYSZa42HCtXRVtQ2MK4sRNuNdCmWLSRxl+ZkwnqBB7MzzAAMOAvdFJ4DswSqleTFGZh
         arcWm5ujeTHLGZ4Zj676c8++Qzs+ztPFSBkhf673QnEMo4oR/WbJv5kdAjaKWaHobNnV
         GLUAB12ZJ7Wtu+HpegFdsL86aclK1PNzOBBXiNfhH8X1Bln7sOE6G4WWl2je1XG7NCzT
         JUMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TAx3syFqqIJA9c7Z2C9kVv5N3v5b52lKJ63hIUR5BM8JdyvV57zXCHCFPJ2v6fS32cdlv7sLeHHeUsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8q9L4NpIxH0A84G6SPuonlpAds5wPqvoAj/nhqpDhrQ7yQeg7
	6iOpo0BCljqu5U03loFSl50Q88mgkuOQ1A/LR6YYrUNpGkp451CJlRT6Dn/dRpjnhRIkldp0DKq
	WvNjBMmrb+Lnf7fmlI+negjbC77M6+ME=
X-Gm-Gg: Acq92OEa1d/MSRtW2znKTOrnYe6x9PaTNsH/dW6qX0xaAeiO2nCD5/+XIZQ4UqK2sp2
	DyNN6YrudKvJBrG0d8jp7m7piLNsQGWZ4H/bg7uA9H9GvWpI2Rl2NK/VYdmp46vrtY2ev06Tcjd
	27adsy8GlEPhDZsspcoi67u5QK3mcT/3RDeq+vK9SXjLEk2HinG06gaNQPZjU1BXLq53bH08QPI
	cqgnO90TPYt9AP7I1n+A9c886bUJ/ShxctO/noTrUmSxzwAZP18cOOpCtjuRfUf6XI5kL3B3CHy
	MsIDsGCXgzkJSZxtz4/m2wqEnqkfm/mWdhHiJL0xF0pe5cITMGQoBiT4DkG8P+qwzWCndg==
X-Received: by 2002:a05:7022:128c:b0:12c:900b:9dee with SMTP id
 a92af1059eb24-1350440ae3fmr2758383c88.1.1779114210581; Mon, 18 May 2026
 07:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517131742.3435209-1-michael.bommarito@gmail.com>
In-Reply-To: <20260517131742.3435209-1-michael.bommarito@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 May 2026 10:23:18 -0400
X-Gm-Features: AVHnY4IjvymyISKz9AQ3FMuidJRAKWnZZII8h8xQPSu6xFoDXnu8vnz8wJD7U3Y
Message-ID: <CADnq5_PP00biS-F6fG2Zp2Md7_ECS7A6zAdWz8YzcnuWir1Tdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix lock leak on ENOMEM in AMDGPU_GEM_OP_GET_MAPPING_INFO
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	David Francis <David.Francis@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62007-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,linaro.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,u.northwestern.edu];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AABCE56ECFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied.  Thanks!

Alex

On Sun, May 17, 2026 at 9:24=E2=80=AFAM Michael Bommarito
<michael.bommarito@gmail.com> wrote:
>
> The AMDGPU_GEM_OP_GET_MAPPING_INFO branch of amdgpu_gem_op_ioctl()
> holds three cleanup-tracked resources before calling kvcalloc():
> the drm_gem_object reference from drm_gem_object_lookup(), the
> drm_exec lock on the looked-up GEM via drm_exec_lock_obj(), and
> the drm_exec lock on the per-process VM root page directory via
> amdgpu_vm_lock_pd().  All three are released by the out_exec
> label that every other error path in this function jumps to.
> The kvcalloc() failure path returns -ENOMEM directly, skipping
> out_exec and leaking all three.
>
> The leaked per-process VM root PD dma_resv lock is the
> load-bearing leak: any subsequent operation on the same VM
> (further GEM ops, command-submission, eviction, TTM shrinker
> callbacks) blocks on the held lock.  DRM_IOCTL_AMDGPU_GEM_OP is
> DRM_AUTH | DRM_RENDER_ALLOW, so this is an unprivileged-local
> denial of service against the caller's GPU context, reachable
> by any process with /dev/dri/renderD* access.
>
> Route the failure through out_exec so drm_exec_fini() and
> drm_gem_object_put() run.
>
> Reproduced on stock 7.0.0-10, Ryzen 7 5700U / Radeon Vega
> (Lucienne): the failing ioctl returns -ENOMEM and a second
> GET_MAPPING_INFO on the same fd then blocks in
> drm_exec_lock_obj() on the leaked dma_resv.  SIGKILL on the
> caller does not reap the task; the fd-release path during
> process exit goes through amdgpu_gem_object_close() ->
> drm_exec_prepare_obj() on the same lock, leaving the task in D
> state until the box is rebooted.  The patched kernel was not
> rebuilt and re-tested on this hardware; the fix is mechanical.
> Tested on a single Lucienne / Vega box only.
>
> Ziyi Guo posted an independent INT_MAX-bound check for
> args->num_entries in the same branch [1]; the two patches are
> complementary and can land in either order.
>
> Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioct=
l")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260208000255.4073363-1-n7l8m4@u.north=
western.edu/ # [1]
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-7
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 9ef80bca4102..8224fb499fdf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -1091,8 +1091,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, vo=
id *data,
>                  * be retried.
>                  */
>                 vm_entries =3D kvcalloc(args->num_entries, sizeof(*vm_ent=
ries), GFP_KERNEL);
> -               if (!vm_entries)
> -                       return -ENOMEM;
> +               if (!vm_entries) {
> +                       r =3D -ENOMEM;
> +                       goto out_exec;
> +               }
>
>                 amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
>                         if (num_mappings < args->num_entries) {
> --
> 2.53.0
>

