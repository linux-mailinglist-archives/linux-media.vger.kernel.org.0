Return-Path: <linux-media+bounces-62077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIfiNLLjC2qdQAUAu9opvQ
	(envelope-from <linux-media+bounces-62077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:14:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510A577278
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0213B3043C30
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D782FC037;
	Tue, 19 May 2026 04:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ae/StVv7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03FB1A9FA4
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164073; cv=pass; b=B7nCvw+eA8hPhZ9CXuQUpu1dBvSyZ53YMFAcGc+QMK8x53ZfM9RdTKxC9uswuwYU16rDGK7CpQDlv9p+EjZkdV05d8ieOhl4btzxNpnstR5OrKiV8u9E492BnEq+3nCiSIx5ZltzdKLNhISPx1qNgqMNGsyY8+uRWWzwmFWRE68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164073; c=relaxed/simple;
	bh=ZN75BNxVhUMX1Jg1VcWsYYID9KMPww5Z2eyKKPXfyeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHXyR7kBvv3aw0b0UwPZ5G2tJ/LowPVkgQdXj70gltEyssy/34Ws4aJXbUNVGvK5H9DoxoQXdwRxHQUmmFpOdJlBICqRlrcKFMdiQNIQFRh3Lqn2FYjnjJrNmYCQTnmF1LZnWMcrzyFs1hLE2vDTTcpkwKobLFeOVNdGzzSAm1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ae/StVv7; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c09c1d000so3885266d50.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 21:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779164071; cv=none;
        d=google.com; s=arc-20240605;
        b=WtRpq/jeZbLFvCqWI8jtNRwGKLZENL8KlOaulIzUb4pZy3qd32bOxqqp4yCv3ElXud
         uV43TKHDc2uxey4dFxLoubQOq/dwKwbC/5ZfelSOlJQmSpIpz4NJ9PZsBkpXAd8l3V+c
         RA0sadl8PCnY8AheQ2yRGFp/8leURR3G0+rJfaE009DeYDeG1r/RfDkwSMh9UOty5nbE
         ZFfepKZqxuQIrKDptEfaAcf3cgbZRbSapprBylFzRPIOTMCc9Xgiu7MSL7M8DJbNK5cM
         +dUE4R3bQropQOfT0ekIfjUyOQ20RrPNjPw6Wk6K7PvisNM6zOm78dD2B/z0JiYTnhFF
         EtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        fh=RerJJCB8soiXZ4ugnL89JPoaYXjNQQnQyW+eZuMYwpU=;
        b=b6uTrWtDoCGRH6DMXM4L07sFh57AspPLhY1FURolsKRNSGgzvGn9SHONSH+120TuSb
         6dKas+62UQM7s0HOkjd04TMNgh1W3b9Tvv9cD8ZSDoU0zIOwnP/plwz9jBQCckDwpTLh
         XJBJvzh1LARb4HIdrA+QVjJoTspxZBAMhx4oH16f+yfzK9GxUD8aRFSBdN81IgJINR0j
         vT8yGw6nLD3CwFOhvhJMjt2CuwxmYvbJNTuG0kYa1TiKo0Mb9Ir25fax2gPxUKGPkqET
         v9y2Yp3jFSeWyT92xy4BzGvgyW/tgiIDsLHPIEMN42EdH805wnCBiTz7iLpsczV9Xyj4
         pyag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779164071; x=1779768871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=Ae/StVv79lL4dTMjrsUzJ59sSeCOagOSCo4hLFo9TCn0vtykqPMt8NkNU9eYZ0nMkV
         bMoh7ttPM8h28DNLleHUGox+F4izNC+hwqv2msXegmksKVtcrF4SU1nAl9aQwby6h5yG
         W+ycg/dx1D1dYiGv+i+jVAijvDuVCCtUHJJ0fkng8883kRmn8eXLzwDSTSx2w1Iyq2Ln
         wSVlWWdgZ3cBrccEVRW+ve0BAPzzgMR0ECf9B2CPujNNp26iyTRHWYcOgah9e04VAn++
         u993AqBtLwLDOkw9YDwKUUTBB0mQyhobzVmNqxFWgHUHp9FP6yFuUouC4jNp6zEGYF9V
         krXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779164071; x=1779768871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=o9ABapFg2HlGYJ7gwq2w/ffMrXrSIoAZLhCqq5AhLlXG+34lRm/699uG4aN74OC9sA
         ElokNFfaqKWearEA1gJcTOSCPYORd54mzX++98M9/C7OdCSJepxeJ4bJiFw8OvmKdR1Q
         lSzXPHuiR6dCIALS2FAaZU5Xt/F7JwqGzPlwhp3XHT3W4nuBqEOxZ739QHjaQm6JmkDE
         Da83/uVMjHOVX1QOt77v7W0oWE1cBEI3UF/yLga2oXKh+3/NGF0VxqhDkHKaoBwhHMh1
         llc3w30/c/x04VmfbVMm1r9yzBvV0kx/3BRiSgp4++zVVCPVmFYDdVhnbN7n+hAxl5co
         lJOw==
X-Forwarded-Encrypted: i=1; AFNElJ9qzEt2AkVArcGJ2q9k3oD8041gx2JkoIuWbAUk/jfSUNTwA/OBZMXvkF6SDKKNsD1Aj5YlVB96DMr4Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBh9cNLdGoSxFq7CTEjQVhoQ6ALqHXzbrV3ERTANFU51tGe7YR
	F0P3mkNQhM+e+RZHQcyoMZyGhey1/56mJJQIxYOsVFH9HrGvnFALB0XwinEL91UJ7UxsbJg0UrD
	Ih2eC/RCSPnpXTn+VHhZZ1hbqI+vHC1OtoS2OgZXC9w==
X-Gm-Gg: Acq92OGxGx1B+xRoyfLkkDPwLIntQjB53cbYl39Or5xvpb+J8B6bNB/jvMiAJL74dWn
	DfAskQRW8jd4PyPt3l0TH9TzzieE9iXIbGI7ztEuW7/ip7Hvi+bspzJbsw/NvuGx3BFSQAgx1oy
	uHvx0p6k30H+IDUkRZOeHNULNN1annEqo7Pin55dp42FQqBXGEhG89Ap7I3FhITqmmPM3m2LsPv
	uB277Y0CHuywukFTb502lWDNkGRAkRftxnCeiOCi3IQme+FP/0WW8oZyhZK9qi6B/KLMFiLjwd0
	R70TGDX6
X-Received: by 2002:a05:690e:438d:b0:65e:782e:9df3 with SMTP id
 956f58d0204a3-65e782ea2bcmr1341256d50.7.1779164070708; Mon, 18 May 2026
 21:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518125500.1000083-1-lgs201920130244@gmail.com> <202605190845.KlMSPp80-lkp@intel.com>
In-Reply-To: <202605190845.KlMSPp80-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:14:18 +0800
X-Gm-Features: AVHnY4Km_xmIfqiLJD15ZaDQr9lLAh1Ogha024FXgf4YUM6n3JdHCvcB7t1E46k
Message-ID: <CANUHTR-J7VY4Jx7WVqEpC+Xg2cR_Rnb=gaA_xecyNO9dmFcyew@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video register failure
To: kernel test robot <lkp@intel.com>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62077-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 5510A577278
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the report.

On Tue, 19 May 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linuxtv-media-pending/master]
> [also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
> base:   https://git.linuxtv.org/media-ci/media-pending.git master
> patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605190845.KlMSPp80-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:33: error: expected ';' after expression
>     1217 |         video_device_release(mdp->vdev)
>          |                                        ^
>          |                                        ;
>    1 error generated.
>
>
> vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
>
>   1172
>   1173  int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
>   1174  {
>   1175          struct device *dev = &mdp->pdev->dev;
>   1176          int ret;
>   1177
>   1178          mdp->variant = &mtk_mdp_default_variant;
>   1179          mdp->vdev = video_device_alloc();
>   1180          if (!mdp->vdev) {
>   1181                  dev_err(dev, "failed to allocate video device\n");
>   1182                  ret = -ENOMEM;
>   1183                  goto err_video_alloc;
>   1184          }
>   1185          mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>   1186          mdp->vdev->fops = &mtk_mdp_m2m_fops;
>   1187          mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
>   1188          mdp->vdev->release = video_device_release_empty;
>   1189          mdp->vdev->lock = &mdp->lock;
>   1190          mdp->vdev->vfl_dir = VFL_DIR_M2M;
>   1191          mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
>   1192          snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
>   1193                   MTK_MDP_MODULE_NAME);
>   1194          video_set_drvdata(mdp->vdev, mdp);
>   1195
>   1196          mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
>   1197          if (IS_ERR(mdp->m2m_dev)) {
>   1198                  dev_err(dev, "failed to initialize v4l2-m2m device\n");
>   1199                  ret = PTR_ERR(mdp->m2m_dev);
>   1200                  goto err_m2m_init;
>   1201          }
>   1202
>   1203          ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
>   1204          if (ret) {
>   1205                  dev_err(dev, "failed to register video device\n");
>   1206                  goto err_vdev_register;
>   1207          }
>   1208          mdp->vdev->release = video_device_release;
>   1209
>   1210          v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
>   1211                    mdp->vdev->num);
>   1212          return 0;
>   1213
>   1214  err_vdev_register:
>   1215          v4l2_m2m_release(mdp->m2m_dev);
>   1216  err_m2m_init:
> > 1217          video_device_release(mdp->vdev)
>   1218          mdp->vdev = NULL;
>   1219  err_video_alloc:
>   1220
>   1221          return ret;
>   1222  }
>   1223
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This build failure was caused by my oversight. I missed the semicolon after
video_device_release(mdp->vdev).

I will send a v2 to fix this issue.

Sorry for the noise.

