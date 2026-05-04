Return-Path: <linux-media+bounces-60285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH8uA92V+GkOwwIAu9opvQ
	(envelope-from <linux-media+bounces-60285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:49:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF14BD3A8
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA4763027967
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 12:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEE33D5654;
	Mon,  4 May 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeYmqqLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB439DBC4
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898934; cv=pass; b=QH650Z+2RRrWuBO2yGNgA/eR3boUQ7oOravwPnax/SguTtn7Rmu7sroXWsTN9w+RpsXnRFe5CG/qC00PpSnffgBnzVx85PlxBdaMbyTczK3i9Pm+pWGvmOCI3R4VOzY/BV0ijkbSlHjlYIG0+TGsJEKnPx1X1FHyqeBF/jteR2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898934; c=relaxed/simple;
	bh=2kY5BIuB+ufB2Pehc7AcK+zOLtv4KIKzsUJRFie7MG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sECX5RUFlpMHkkeHXov+63oLqR5mBK4AeRylgpNDu8+z8W5a/D4/ei9Be8Jo/kbSVFOrdqPDjIi68Y8iXqr4MgIfmh9RfN7YPCK+nRmPgK1iBjWRa2w1xeqq4cwCHsoc1brx4ZRyZpwBV/xBXa1Urir47xwfnz8A7HhvYd9LX+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeYmqqLd; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-794719afcd4so35850817b3.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 05:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777898930; cv=none;
        d=google.com; s=arc-20240605;
        b=HMdmE0IWebjCgxFPtkCBh64ePcMzGJtW6+U3Ek8I1Jr48ttov63bHo91B9FWUqFyRl
         PT7tRFz+ur/sxd4AqSZt5jtcuWPfl21v/ykLWgjbcus6x7RznEzu48eXRkhw55lWO+iM
         u+QZpmTMg8xhPkSt9MvK4EuzUFBS1WdNzL6Sz37bD3d/vmibrhxXQmGU5tdvm2b1G2A/
         cg9TCMGm1NlP+OIj9uj/Wq6wIxOuWck2mJFY06+xNhS+e4cgdiB+8ABu+TWt4G3cuIN+
         wFslNCdehQqQ4fjVRyhMDFZzkHjU1xjlR5qqZ+KY4D/UVnQrgfNzXe1X6Pfn7PDroJFJ
         kqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        fh=2sKlpLCze+jRJ2SzZepppO7tYG8qqjcJauaFgQU4daY=;
        b=lgMusH1TT/NxbW2tnwHOz0iWMuqteew4Ayv7BjY1M3JZ3bLR9/BUizEDwtwfKGJe0l
         YpcN9YTDmiIfn0sLgCCXpcAta1NVmXrXr0dpkvf7bB7DIuJQ05e4KQoDnVl7hxtpPc3V
         kdhhFS2QspXdgjRnxXEG889m0Cvezw6cjzgmWvwsSO3aDLHTtAOTFzVT/tuoNeA1Ct8f
         TyujWXscFTJsl7TwToFWz8pXC/9skH5H6rfNqXu4cNUn0R4i+FhkvSVnimb7VUZTqBO1
         7jyA9w83N8iG2sXgfWLyS2rsOk8/y2LfSJGokPEsEKZnw6GHP3Jhkwyf9eiGWR7kimZE
         eS+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898930; x=1778503730; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        b=jeYmqqLdeWh+S8o56wiQRXWbQyutbU2mYtrB3xgWq9KIZwFkEAxIV9qdCO60GPmokO
         VtuivLyLCrbNryysWuBJTftSUJyjlA369xuBT1O79c2IxAk0lJfpDCfyw5RemvToDVhd
         q6RMIy5pRrds7eip9ml/4Co/GVvTBx8Z2NpGi5yfqMtGO1ANnR3JBX8Yh6fG5GIHKwSW
         PdMbHwck9CAjTn0ZICXgVyaYNSI22VcoTa9k1vReKJsICX7wmUzJnj/7V2Z7BI6BEyoG
         PhOhnE9t/uBI0EnBHLDbkVCw5OcUCng0dmPYoDFoj6yazq1RxceThgVK5UfesZqflCDT
         BKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898930; x=1778503730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwgutxwEVlGDgPMcTWx07aMbhOve2XFxqkKRegLCJPo=;
        b=AtILldNAh+lg5K/RA0o2thMppUh6twTlst2CtPy3VRz2yexWG8izlQ7DtDrXPowuqN
         Ywr6mUgedY/6GWAAVYsHbnGqfHMD2D2zHYtp+lLOASwXFAerJ1DbFqoLm1WXiOxtomNY
         +3LXAO8oMe3Sp4q8GwK+Xstby+dwdq7EPqBSSHY3rFXq8zH6sFvk36jBT8jp7H9Lzrc2
         MBf04MJR4y3kzcAr2bKUI9WCKryuDk8jxh8FLJZh5B+qoXW94gOBxRH8jP0/O6ZU4cSD
         SeBwbgi5Gk3I39+9A0t1/XWfkZVBiVKzoUwA+essALnui9O5iqUw2nRcuzoPcKS3Rnwh
         8jug==
X-Forwarded-Encrypted: i=1; AFNElJ8UIrPdPaHrE36EZrg5t5X5fTa6YblB4brzu6WAUqXFDJZSAa9VU4mj9vmXL2+S8teZsf2zwGozlpqrZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5+8qO1Ad/xy/PDjDrnRgUbt/8MWGREiIkNIPrL+UUhFDsGNg
	Bw0mPfRloz6dsUSYX0EHNfwCmi2RmzV1EG1zP6X81KzsgmtB/eaJxkMqkal89OvBMzyOhrdPRXM
	MZCJ7yk5RukyOT6lgI23AnvwO8fkpznA=
X-Gm-Gg: AeBDieu4zQc2PI3IhTfm7SpswWPvA94k0o2BjTfTjBXV7BVTRyzAI0/mYRFA+rLX4AZ
	htyP/4g5C4k25syxVXjQ1QaWpi4hQsg9VfwbGToh37Ox3XWlZEo8cw03sBUCsq12gdL3zB8lMiT
	Zu21EvANpOu+ZbpOJ7Vqad1nG6qTxYTWctwqijc5QSo46nNqsAEmGCnCTbZgnKPNYwW/uVu3XoM
	INcoKJ8XazKiSm3UppyPFWW1ZgOq6v+4NO5l/DPdx/5CyR+bk+8mCpy/+0jFPefGuOb8q+STloA
	Cfn2eYJbn6tCyXBRFQ==
X-Received: by 2002:a05:690e:168c:b0:651:d0a5:ce2 with SMTP id
 956f58d0204a3-65c3dbd0c18mr9274835d50.60.1777898929910; Mon, 04 May 2026
 05:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430053820.446080-1-lgs201920130244@gmail.com> <202605032224.WHCEx7uc-lkp@intel.com>
In-Reply-To: <202605032224.WHCEx7uc-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 4 May 2026 20:48:40 +0800
X-Gm-Features: AVHnY4KjNnZnjqUSHDRUd793YOF0624mKw7IO-xD2BfGfwjxsYdj1bk1K-D3VyQ
Message-ID: <CANUHTR_UeQq5hLtLFMqeEORbGuWTJBZdpmi+0AqzzO42y-S3ow@mail.gmail.com>
Subject: Re: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
To: kernel test robot <lkp@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 62EF14BD3A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60285-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,mail.gmail.com:mid]

Hi kernel test robot,

Thanks for the report.

On Sun, 3 May 2026 at 22:52, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on staging/staging-testing]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-staging-ipu7-Fix-pdata-double-free-in-init-error-paths/20260501-032323
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20260430053820.446080-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605032224.WHCEx7uc-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032224.WHCEx7uc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605032224.WHCEx7uc-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_isys_init':
> >> drivers/staging/media/ipu7/ipu7.c:2176:33: error: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
>     2176 |                 return ERR_CAST(ret);
>          |                                 ^~~
>          |                                 |
>          |                                 int
>    In file included from include/linux/cleanup.h:6,
>                     from include/linux/acpi.h:11,
>                     from drivers/staging/media/ipu7/ipu7.c:6:
>    include/linux/err.h:102:64: note: expected 'const void *' but argument is of type 'int'
>      102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
>          |                                                    ~~~~~~~~~~~~^~~
>    drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_psys_init':
>    drivers/staging/media/ipu7/ipu7.c:2221:33: error: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
>     2221 |                 return ERR_CAST(ret);
>          |                                 ^~~
>          |                                 |
>          |                                 int
>    include/linux/err.h:102:64: note: expected 'const void *' but argument is of type 'int'
>      102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
>          |                                                    ~~~~~~~~~~~~^~~
>
>
> vim +/ERR_CAST +2176 drivers/staging/media/ipu7/ipu7.c
>
>   2125
>   2126  static struct ipu7_bus_device *
>   2127  ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>   2128                 const struct ipu_buttress_ctrl *ctrl, void __iomem *base,
>   2129                 const struct ipu_isys_internal_pdata *ipdata,
>   2130                 unsigned int nr)
>   2131  {
>   2132          struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>   2133          struct ipu7_bus_device *isys_adev;
>   2134          struct device *dev = &pdev->dev;
>   2135          struct ipu7_isys_pdata *pdata;
>   2136          int ret;
>   2137
>   2138          ret = ipu7_isys_check_fwnode_graph(fwnode);
>   2139          if (ret) {
>   2140                  if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
>   2141                          dev_err(dev,
>   2142                                  "fwnode graph has no endpoints connection\n");
>   2143                          return ERR_PTR(-EINVAL);
>   2144                  }
>   2145
>   2146                  ret = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
>   2147                  if (ret) {
>   2148                          dev_err_probe(dev, ret, "IPU bridge init failed\n");
>   2149                          return ERR_PTR(ret);
>   2150                  }
>   2151          }
>   2152
>   2153          pdata = kzalloc_obj(*pdata);
>   2154          if (!pdata)
>   2155                  return ERR_PTR(-ENOMEM);
>   2156
>   2157          pdata->base = base;
>   2158          pdata->ipdata = ipdata;
>   2159
>   2160          isys_adev = ipu7_bus_initialize_device(pdev, parent, pdata, ctrl,
>   2161                                                 IPU_ISYS_NAME);
>   2162          if (IS_ERR(isys_adev)) {
>   2163                  dev_err_probe(dev, PTR_ERR(isys_adev),
>   2164                                "ipu7_bus_initialize_device isys failed\n");
>   2165                  kfree(pdata);
>   2166                  return ERR_CAST(isys_adev);
>   2167          }
>   2168
>   2169          isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
>   2170                                         &ipdata->hw_variant);
>   2171          if (IS_ERR(isys_adev->mmu)) {
>   2172                  ret = PTR_ERR(isys_adev->mmu);
>   2173                  dev_err_probe(dev, ret,
>   2174                                "ipu7_mmu_init(isys_adev->mmu) failed\n");
>   2175                  put_device(&isys_adev->auxdev.dev);
> > 2176                  return ERR_CAST(ret);
>   2177          }
>   2178
>   2179          isys_adev->mmu->dev = &isys_adev->auxdev.dev;
>   2180          isys_adev->subsys = IPU_IS;
>   2181
>   2182          ret = ipu7_bus_add_device(isys_adev);
>   2183          if (ret)
>   2184                  return ERR_PTR(ret);
>   2185
>   2186          return isys_adev;
>   2187  }
>   2188
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

The build failure is caused by my use of ERR_CAST(ret) after caching
PTR_ERR(isys_adev->mmu) / PTR_ERR(psys_adev->mmu) into the integer variable
ret. ERR_CAST() expects an error pointer, not an integer error code.

I will fix this in v2 by returning ERR_PTR(ret) instead.

Thanks,
Guangshuo

