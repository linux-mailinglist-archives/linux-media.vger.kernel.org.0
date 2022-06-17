Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D517954F36D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 10:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381265AbiFQIoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 04:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381237AbiFQIod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 04:44:33 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C9069B5B
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 01:44:23 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220617084418euoutp02cccf870ea43531ec1ac6924734a4869b~5W-gNGVYk0573805738euoutp02X
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 08:44:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220617084418euoutp02cccf870ea43531ec1ac6924734a4869b~5W-gNGVYk0573805738euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1655455459;
        bh=rKZdEiMovQmn63kdI7IfL25qtFlJYZXaMBJfT2lGkEs=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=fh93mo5ho9bMT7PDHYfRy3WtypC5/fVx6GTfi7luR86lnUzFYDUEFmiaSWA+rYc7O
         Wsj4DdwJ9dPEabwY/gDAQK2NY71p8PDPRUhI6vGwOiYtndRSlptQ8fE9TJTHy6z8KK
         L0wqu6YjkhwVSJ+Ik9zg7tRggzVVBU7Ry4gg2ELw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220617084418eucas1p225fef3c40b107ecb271aa4c2a95f4f84~5W-f0nFMB1294312943eucas1p2F;
        Fri, 17 Jun 2022 08:44:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 79.C1.09580.2EE3CA26; Fri, 17
        Jun 2022 09:44:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220617084418eucas1p192dfca043bd0e0f7f335946f9e95e658~5W-fe6KL_2638226382eucas1p1k;
        Fri, 17 Jun 2022 08:44:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220617084418eusmtrp2464cc7b5da15e2d6db9084c357103a26~5W-feH6LH2103621036eusmtrp2e;
        Fri, 17 Jun 2022 08:44:18 +0000 (GMT)
X-AuditID: cbfec7f5-9c3ff7000000256c-37-62ac3ee23205
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.2E.09038.2EE3CA26; Fri, 17
        Jun 2022 09:44:18 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220617084417eusmtip24d4b2b1f8bcf86aa9ab7c5eebfa20f7f~5W-e4KPlr0877708777eusmtip2u;
        Fri, 17 Jun 2022 08:44:17 +0000 (GMT)
Message-ID: <02e56970-d8eb-25a9-4f86-df065227a727@samsung.com>
Date:   Fri, 17 Jun 2022 10:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] media: camss: Allocate power domain resources
 dynamically
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220512082318.189398-1-vladimir.zapolskiy@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURTldabTgaQ4FkkvSzTWLRJFFpeJGIIJajWIqECCUXCQsRDbQlpQ
        kQ81uEDVqOCCwwekIktBBRQiUENoVEQCCLggAlophlQQChhRUbSOC3/nniX33JdHYpJcoTuZ
        oE5mNWpGKSOc8OpHX9qWvwssi/W5Xu5Gt/Z/w+nm+o84fbG+RUSfLa8S0oWVUwJ6jDNjtOnS
        FYLOz+HwIFJew/WK5JWGTELe88JIyMcr54bhu5zWxbHKhIOsZkXgXqf4cq4NTzpOHz5htQmP
        IdtyHXIkgVoJpUVnRDrkREqoYgSfzdUCfphAkP7qB84P4wh6ckyCvxGuYYDghSIED8eKED/Y
        EPSVDiG7S0wFQtZg568ESeLUIjg1GcHTs6HpmgW3Y1cqFvKqTwrtFhcqDB5Y4+w0Rkmh25L3
        u8Uc6jiCiqY2IS8YEUxl77FjgvIF3bCOsGNHKhgsfdki3jMP0qtyMXsYKAsJZ2zpiG8dDIax
        AhGPXcDaePcP9oTpmrzfPYFKhO85/jx9GF58KMN4HAA9rV8JuwWjlsLt2hU8vR4Ks9sRn3SG
        ruHZfANnyKq+ivG0GDJOSXj3YuAab/3b2fC0A7uAZNyMN+FmHM/NuIX7vzcf4QYkZVO0KgWr
        9Vezh7y1jEqbolZ470tUVaJf/6f5R+One6jYavM2IQGJTAhITDZHvHpnSaxEHMekHmE1iTGa
        FCWrNSEPEpdJxfsSyhkJpWCS2QMsm8Rq/qoC0tH9mOBca8f5uukF+RVHs+M4Bz8SDNERp9ck
        +U9tExptBcHd7XrOWhfiMbqDaciIDCw4pB9YFKNkPlpWzVdEudV7vvVJO6BqiWrx6lf4bmxo
        9VSd5Uo2vX65ba1+tGrU+i60a91ua7M1sj+YeAyFQ2kLq7bPRZf9B3Oxkb6jOsPVTUFGret+
        szl8gzng4qsB9Z0TztG9g5IYh4xQZfGzLcPvp8dXX55cNjIxFCRNUkCqPFMfYVaG+i15Uuvo
        N+g+og+la4JqHDbf84reesPYEWEMqe08KMgoFdeltD82nlz5oXbUtXvZzYkLj7Lynt/vnJXp
        kfi+6014kY/FNTpcet4lOUSGa+MZXy9Mo2V+Ak1UEkquAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7qP7NYkGbS3cVice/ybxeL0/ncs
        FhP3n2W36NmwldVi2aY/TBafZj1ktjg0ZRqbxYIZs1gcODx2zrrL7rFpVSebx51re9g8Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvY
        MOs8S0GjRUXLq4+sDYwfdbsYOTkkBEwkZh18ytbFyMUhJLCUUeLy/kksEAkZiZPTGlghbGGJ
        P9e6oIreM0o03lzBCJLgFbCTmPTiMlMXIwcHi4CqRNuPUIiwoMTJmU/A5ogKJEnM27sarFxY
        wE/i++xXbCA2s4C4xK0n85lAZooINDJKvD+/ggXEYRbYxyjx/coSdpChQgLOEm3fKkEa2AQM
        JbredoE1cwq4SDy5N5kdYpCZRNfWLkYIW16ieets5gmMQrOQ3DELyb5ZSFpmIWlZwMiyilEk
        tbQ4Nz232EivODG3uDQvXS85P3cTIzDqth37uWUH48pXH/UOMTJxMB5ilOBgVhLhNQtemSTE
        m5JYWZValB9fVJqTWnyI0RQYFhOZpUST84Fxn1cSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCe
        WJKanZpakFoE08fEwSnVwGS6kr99ZmSclKeu5W9OycCi/l26qeen/dkwvfCp9Wq+iW0Ve2Zc
        57+y4atJq/Sc2/w2XCXmKocYb1X2PNM+6urv19a+ZKNqzN4oF+1oGRE91zndagofbh1J1RCV
        WrJsx0bpapFj66LXpQT9+NR5dxGvnDtz/qcX0RXLTyq0b/y/tqa2fcXb6W/s5s6fKD0zdpuy
        Yf1lpZtdMev/L7bZq73ZfPI7lenx8xi4TSZNMsq3+BZbaLAiemXDklk6ws/Tw0PYX6XI7Qra
        p1/47GvnFtsVp0LyTvn0KITGJcnb8l1ZsfP2q+X6kQ/fffuTxb3Hiv3RPy/+raGK79++7XrN
        9kzg2Ls7/7qd3hxd3aejN1mJpTgj0VCLuag4EQBJciJkQwMAAA==
X-CMS-MailID: 20220617084418eucas1p192dfca043bd0e0f7f335946f9e95e658
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220617084418eucas1p192dfca043bd0e0f7f335946f9e95e658
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220617084418eucas1p192dfca043bd0e0f7f335946f9e95e658
References: <20220512082318.189398-1-vladimir.zapolskiy@linaro.org>
        <CGME20220617084418eucas1p192dfca043bd0e0f7f335946f9e95e658@eucas1p1.samsung.com>
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12.05.2022 10:23, Vladimir Zapolskiy wrote:
> To simplify the driver's maintenance it makes sense to escape from
> hardcoded numbers of power domain resources per platform and statical
> allocation of the resources. For instance on a QCOM SM8450 platform
> the number of CAMSS power domains shall be bumped up to 6, also notably
> CAMSS on MSM8916 has only one power domain, however it expects to get 2,
> and thus it should result in a runtime error on driver probe.
>
> The change fixes an issue mentioned above and gives more flexibility
> to support more platforms in future.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

This patch landed recently in linux next-20220616 as commit f673698ceee5 
("media: camss: Allocate power domain resources dynamically"). 
Unfortunately it causes serious issues on DragonBoard 410c SBC 
(arch/arm64/boot/dts/qcom/apq8016-sbc.dts), like multiple 'Unable to 
handle kernel NULL pointer dereference at virtual address 0000000000000000'.

The problem originates in camss_configure_pd() function. Old version 
assigned 0 to camss->genpd_num on that board, while the new one sets it 
to 1 as a result of of_count_phandle_with_args(). When it is set to 1, 
it causes issues somewhere later in the code, the stack traces points to 
sysfs:

Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000000
Mem abort info:
   ESR = 0x0000000096000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000006
   CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000080fba000
[0000000000000000] pgd=0800000080fd7003, p4d=0800000080fd7003, 
pud=0800000080fdb003, pmd=0000000000000000
Internal error: Oops: 96000006 [#2] PREEMPT SMP
Modules linked in: crct10dif_ce asix(+) qcom_wcnss_pil socinfo adv7511 
snd_soc_msm8916_digital snd_soc_lpass_apq8016 snd_soc_lpass_cpu 
snd_soc_lpass_platform snd_soc_apq8016_sbc snd_soc_qcom_common qrtr 
qcom_q6v5_mss qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common 
qcom_glink_smem qmi_helpers snd_soc_msm8916_analog qcom_camss 
qnoc_msm8916 icc_smd_rpm videobuf2_dma_sg v4l2_fwnode 
qcom_spmi_temp_alarm v4l2_async rtc_pm8xxx videobuf2_memops venus_core 
qcom_pon v4l2_mem2mem videobuf2_v4l2 qcom_spmi_vadc qcom_vadc_common 
videobuf2_common qcom_rng qcom_stats msm videodev i2c_qcom_cci mc 
mdt_loader gpu_sched drm_dp_aux_bus display_connector rmtfs_mem
CPU: 0 PID: 255 Comm: systemd-udevd Tainted: G      D W 
5.19.0-rc2-next-20220616 #12197
Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : sysfs_kf_seq_show+0x34/0x140
lr : sysfs_kf_seq_show+0x30/0x140
ng swap..[   23.849418] sp : ffff80000c643bc0
...
Call trace:
  sysfs_kf_seq_show+0x34/0x140
  kernfs_seq_show+0x28/0x30
  seq_read_iter+0x118/0x440
  kernfs_fop_read_iter+0x11c/0x1b0
  new_sync_read+0xd0/0x188
  vfs_read+0x134/0x1d0
  ksys_read+0x64/0xf0
  __arm64_sys_read+0x14/0x20
  invoke_syscall+0x40/0xf8
  el0_svc_common.constprop.3+0x8c/0x120
  do_el0_svc_compat+0x18/0x48
  el0_svc_compat+0x48/0xd0
  el0t_32_sync_handler+0xec/0x140
  el0t_32_sync+0x160/0x164
Code: f9401821 f9404437 97fffe37 aa0003f5 (f9400000)
---[ end trace 0000000000000000 ]---


> ---
>   drivers/media/platform/qcom/camss/camss.c | 38 +++++++++++++----------
>   drivers/media/platform/qcom/camss/camss.h |  7 ++---
>   2 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 79ad82e233cb..32d72b4f947b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1452,19 +1452,31 @@ static const struct media_device_ops camss_media_ops = {
>   
>   static int camss_configure_pd(struct camss *camss)
>   {
> -	int nbr_pm_domains = 0;
> +	struct device *dev = camss->dev;
>   	int last_pm_domain = 0;
>   	int i;
>   	int ret;
>   
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660)
> -		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -	else if (camss->version == CAMSS_845 ||
> -		 camss->version == CAMSS_8250)
> -		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
> +	camss->genpd_num = of_count_phandle_with_args(dev->of_node,
> +						      "power-domains",
> +						      "#power-domain-cells");
> +	if (camss->genpd_num < 0) {
> +		dev_err(dev, "Power domains are not defined for camss\n");
> +		return camss->genpd_num;
> +	}
> +
> +	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
> +					  sizeof(*camss->genpd), GFP_KERNEL);
> +	if (!camss->genpd)
> +		return -ENOMEM;
>   
> -	for (i = 0; i < nbr_pm_domains; i++) {
> +	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
> +					       sizeof(*camss->genpd_link),
> +					       GFP_KERNEL);
> +	if (!camss->genpd_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < camss->genpd_num; i++) {
>   		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
>   		if (IS_ERR(camss->genpd[i])) {
>   			ret = PTR_ERR(camss->genpd[i]);
> @@ -1689,7 +1701,6 @@ static int camss_probe(struct platform_device *pdev)
>   
>   void camss_delete(struct camss *camss)
>   {
> -	int nbr_pm_domains = 0;
>   	int i;
>   
>   	v4l2_device_unregister(&camss->v4l2_dev);
> @@ -1698,14 +1709,7 @@ void camss_delete(struct camss *camss)
>   
>   	pm_runtime_disable(camss->dev);
>   
> -	if (camss->version == CAMSS_8x96 ||
> -	    camss->version == CAMSS_660)
> -		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
> -	else if (camss->version == CAMSS_845 ||
> -		 camss->version == CAMSS_8250)
> -		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
> -
> -	for (i = 0; i < nbr_pm_domains; i++) {
> +	for (i = 0; i < camss->genpd_num; i++) {
>   		device_link_del(camss->genpd_link[i]);
>   		dev_pm_domain_detach(camss->genpd[i], true);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index c9b3e0df5be8..0db80cadbbaa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -69,9 +69,7 @@ struct resources_icc {
>   enum pm_domain {
>   	PM_DOMAIN_VFE0 = 0,
>   	PM_DOMAIN_VFE1 = 1,
> -	PM_DOMAIN_GEN1_COUNT = 2,	/* CAMSS series of ISPs */
>   	PM_DOMAIN_VFELITE = 2,		/* VFELITE / TOP GDSC */
> -	PM_DOMAIN_GEN2_COUNT = 3,	/* Titan series of ISPs */
>   };
>   
>   enum camss_version {
> @@ -101,8 +99,9 @@ struct camss {
>   	int vfe_num;
>   	struct vfe_device *vfe;
>   	atomic_t ref_count;
> -	struct device *genpd[PM_DOMAIN_GEN2_COUNT];
> -	struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
> +	int genpd_num;
> +	struct device **genpd;
> +	struct device_link **genpd_link;
>   	struct icc_path *icc_path[ICC_SM8250_COUNT];
>   	struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
>   };

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

