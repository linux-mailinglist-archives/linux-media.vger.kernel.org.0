Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0506B570E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 22:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfIQUjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 16:39:09 -0400
Received: from mail-eopbgr700082.outbound.protection.outlook.com ([40.107.70.82]:62560
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726663AbfIQUjI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 16:39:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkNXmFbOqXS2pIo98vEpomnvcfFSgzSwOv1/IzCHDAmOBo18TJyP6Q+K1qGeHf+iieIr9WEN3PHc79o/eOjfFpOFrugSbml6a9KztNOMlgut3Uwl0XvB/j7TacI9KhDBDflcFgtZWapX8+y6WZHykBpykhK6gp5fzJlhSjG/1TrfL/jFROPnRsj0DU75i7E56gY++aClqmG+f/6hQWD/GgQ8nMT4gh0yExEiszphiwYYgJlNTryXauid16qbRcabAHbZXM3O0bBM3GHVMeyJw/jjoa0bocgfNbzfu2aCrdFM8/UXmljNAHdKO6SFzjMxX/MhK1e9ulbOp1N/tHjWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQBvwab6DibAkCoyEAm150auTF2I2tNQP/UdQM40sP0=;
 b=e0otuwOM8dHWw9WwLrSo5pYsBImEvj+WWBHhrCItfb6f82+IcqAKRnANOYk/Tpx/sur5eaPTgJYuDqpyQpAsh/KmLkdyIUSFnzR3o3MRRXUGssTqUjuGPTi4O1d4WAKPuCfkjVSNizPPirudjvtaA/1KdOIicvaISm6cG4zbo1tNxkJDIn+B0AZXipZE0SURp1KUaRGE+HGmWEpWomsIzVX5CMBbeOjpBZ1Dr/IhcYDouAfNl76uwSt98vAm+9jkzZskxSP3WNFpbBSa7J3gqHU+svSC8pAWGJfZTmtW2/VEUPvAVaQU4f7qrtv3Te17ol57CKmocE/ESIDY+tSr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQBvwab6DibAkCoyEAm150auTF2I2tNQP/UdQM40sP0=;
 b=T6CQK9E9f0zeYqravx+X3nSDsy6f2YiWMxlC3l84FBmxipGGi6xT5PCkAufXVYumPXzc0TaqGJusB074PojLFcEJR8tHMmT9N/UFFQKiAnRiXGzgedo8h6VlGDFfn/veXNzqvZclhSfPhIv1nSmA8SBMEe1A2NoygwRTf3C+KMo=
Received: from BYAPR02MB5702.namprd02.prod.outlook.com (20.178.0.221) by
 BYAPR02MB4104.namprd02.prod.outlook.com (20.176.249.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Tue, 17 Sep 2019 20:39:03 +0000
Received: from BYAPR02MB5702.namprd02.prod.outlook.com
 ([fe80::3551:3adf:4ff9:5bc5]) by BYAPR02MB5702.namprd02.prod.outlook.com
 ([fe80::3551:3adf:4ff9:5bc5%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 20:39:03 +0000
From:   Dylan Yip <dylany@xilinx.com>
To:     Dylan Yip <dylany@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Subject: RE: [LINUX PATCH] dma-mapping: Control memset operation using gfp
 flags
Thread-Topic: [LINUX PATCH] dma-mapping: Control memset operation using gfp
 flags
Thread-Index: AQHVbZYexpoU+qkkQESS3T/iGUGZXacwVKBQ
Date:   Tue, 17 Sep 2019 20:39:03 +0000
Message-ID: <BYAPR02MB5702C4B005C6F4E21209074AB08F0@BYAPR02MB5702.namprd02.prod.outlook.com>
References: <1568751684-8809-1-git-send-email-dylan.yip@xilinx.com>
In-Reply-To: <1568751684-8809-1-git-send-email-dylan.yip@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dylany@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a167484-b53a-4c98-eba8-08d73baf13f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR02MB4104;
x-ms-traffictypediagnostic: BYAPR02MB4104:|BYAPR02MB4104:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB41049A20D63120758B3161D4B08F0@BYAPR02MB4104.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(13464003)(189003)(199004)(66946007)(3846002)(66066001)(25786009)(6436002)(5660300002)(14454004)(6636002)(316002)(110136005)(6116002)(86362001)(8936002)(53546011)(6506007)(7696005)(81166006)(99286004)(2906002)(8676002)(81156014)(76176011)(476003)(11346002)(446003)(2501003)(71200400001)(71190400001)(66556008)(26005)(186003)(478600001)(66446008)(66476007)(64756008)(256004)(486006)(14444005)(102836004)(33656002)(6246003)(7736002)(74316002)(52536014)(229853002)(9686003)(55016002)(305945005)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4104;H:BYAPR02MB5702.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WHPHQOBQPZfh2t2jGomNKEjSyKYnbrjeXY+3d6+NGgdLzLMsDRZZZ67xcqaoUp+n6envsHk+y5t/xOjjedl24ftULH6Hb23GScVXtAUpJN1KryWn0bMgvLmyfwDxGEyj0HSOLVIrCvtSDx2cUkN2chsHq4gcwKANlDYWjZL/+Qr89rI6ZYaW7E8tzLtHoivlaOHwiYD/2WJU0/hxRtkDPjeWiP1Eoz2zRzMEqzC5N1B+mUJO88zd2qZDOrRBXCd7Om1+sj65cs0+AY7zXV+vfhG2W4+ziGtzVyi2RoYJvYsh2xQLR/D5JbuXE4QHtgL+zMG/bo8xf4pUokbtFGDq13kplX75iRN0D3WYrBtYNXfQgnrEjgictkiaNaVEk/ZbvaFt9T9QmY3vk2M5vLgleQoY4imzfj7YPHlK9BAX+7U=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a167484-b53a-4c98-eba8-08d73baf13f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 20:39:03.3828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: it7B+qey0I24Gtu+U/Fi+nuU3OJy0ldlDqQNcyuTJ62HU7+lCdzpCIDkieGc7vdtweN60HE6MGJIkvRJyMi01Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4104
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please ignore, sent to wrong list.

> -----Original Message-----
> From: Dylan Yip <dylan.yip@xilinx.com>
> Sent: Tuesday, September 17, 2019 1:21 PM
> To: linux-media@vger.kernel.org; Satish Kumar Nagireddy
> <SATISHNA@xilinx.com>
> Cc: Dylan Yip <dylany@xilinx.com>
> Subject: [LINUX PATCH] dma-mapping: Control memset operation using gfp
> flags
>=20
> In case of 4k video buffer, the allocation from a reserved memory is taki=
ng a
> long time, ~500ms. This is root caused to the memset() operations on the
> allocated memory which is consuming more cpu cycles.
> Due to this delay, we see that initial frames are being dropped.
>=20
> To fix this, we have wrapped the default memset, done when allocating
> coherent memory, under the __GFP_ZERO flag. So, we only clear allocated
> memory if __GFP_ZERO flag is enabled. We believe this should be safe as t=
he
> video decoder always writes before reading.
> This optimizes decoder initialization as we do not set the __GFP_ZERO fla=
g
> when allocating memory for decoder. With this optimization, we don't see
> initial frame drops and decoder initialization time is ~100ms.
>=20
> This patch adds plumbing through dma_alloc functions to pass gfp flag set=
 by
> user to __dma_alloc_from_coherent(). Here gfp flag is checked for
> __GFP_ZERO. If present, we memset the buffer to 0 otherwise we skip
> memset.
>=20
> Signed-off-by: Dylan Yip <dylan.yip@xilinx.com>
> ---
>  arch/arm/mm/dma-mapping-nommu.c |  2 +-
>  include/linux/dma-mapping.h     | 11 +++++++----
>  kernel/dma/coherent.c           | 15 +++++++++------
>  kernel/dma/mapping.c            |  2 +-
>  4 files changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-
> mapping-nommu.c index 52b8255..242b2c3 100644
> --- a/arch/arm/mm/dma-mapping-nommu.c
> +++ b/arch/arm/mm/dma-mapping-nommu.c
> @@ -35,7 +35,7 @@ static void *arm_nommu_dma_alloc(struct device *dev,
> size_t size,
>  				 unsigned long attrs)
>=20
>  {
> -	void *ret =3D dma_alloc_from_global_coherent(size, dma_handle);
> +	void *ret =3D dma_alloc_from_global_coherent(size, dma_handle,
> gfp);
>=20
>  	/*
>  	 * dma_alloc_from_global_coherent() may fail because:
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index f7d1eea..b715c9f 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -160,24 +160,27 @@ static inline int is_device_dma_capable(struct
> device *dev)
>   * Don't use them in device drivers.
>   */
>  int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
> -				       dma_addr_t *dma_handle, void **ret);
> +				       dma_addr_t *dma_handle, void **ret,
> +				       gfp_t flag);
>  int dma_release_from_dev_coherent(struct device *dev, int order, void
> *vaddr);
>=20
>  int dma_mmap_from_dev_coherent(struct device *dev, struct
> vm_area_struct *vma,
>  			    void *cpu_addr, size_t size, int *ret);
>=20
> -void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t
> *dma_handle);
> +void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t
> *dma_handle,
> +				     gfp_t flag);
>  int dma_release_from_global_coherent(int order, void *vaddr);  int
> dma_mmap_from_global_coherent(struct vm_area_struct *vma, void
> *cpu_addr,
>  				  size_t size, int *ret);
>=20
>  #else
> -#define dma_alloc_from_dev_coherent(dev, size, handle, ret) (0)
> +#define dma_alloc_from_dev_coherent(dev, size, handle, ret, flag) (0)
>  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)  #define
> dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
>=20
>  static inline void *dma_alloc_from_global_coherent(ssize_t size,
> -						   dma_addr_t *dma_handle)
> +						   dma_addr_t *dma_handle,
> +						   gfp_t flag)
>  {
>  	return NULL;
>  }
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c index
> 29fd659..d85fab5 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -136,7 +136,7 @@ void dma_release_declared_memory(struct device
> *dev)  EXPORT_SYMBOL(dma_release_declared_memory);
>=20
>  static void *__dma_alloc_from_coherent(struct dma_coherent_mem
> *mem,
> -		ssize_t size, dma_addr_t *dma_handle)
> +		ssize_t size, dma_addr_t *dma_handle, gfp_t gfp_flag)
>  {
>  	int order =3D get_order(size);
>  	unsigned long flags;
> @@ -158,7 +158,8 @@ static void *__dma_alloc_from_coherent(struct
> dma_coherent_mem *mem,
>  	*dma_handle =3D mem->device_base + (pageno << PAGE_SHIFT);
>  	ret =3D mem->virt_base + (pageno << PAGE_SHIFT);
>  	spin_unlock_irqrestore(&mem->spinlock, flags);
> -	memset(ret, 0, size);
> +	if (gfp_flag & __GFP_ZERO)
> +		memset(ret, 0, size);
>  	return ret;
>  err:
>  	spin_unlock_irqrestore(&mem->spinlock, flags); @@ -172,6 +173,7
> @@ static void *__dma_alloc_from_coherent(struct dma_coherent_mem
> *mem,
>   * @dma_handle:	This will be filled with the correct dma handle
>   * @ret:	This pointer will be filled with the virtual address
>   *		to allocated area.
> + * @flag:      gfp flag set by user
>   *
>   * This function should be only called from per-arch dma_alloc_coherent(=
)
>   * to support allocation from per-device coherent memory pools.
> @@ -180,24 +182,25 @@ static void *__dma_alloc_from_coherent(struct
> dma_coherent_mem *mem,
>   * generic memory areas, or !0 if dma_alloc_coherent should return @ret.
>   */
>  int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
> -		dma_addr_t *dma_handle, void **ret)
> +		dma_addr_t *dma_handle, void **ret, gfp_t flag)
>  {
>  	struct dma_coherent_mem *mem =3D
> dev_get_coherent_memory(dev);
>=20
>  	if (!mem)
>  		return 0;
>=20
> -	*ret =3D __dma_alloc_from_coherent(mem, size, dma_handle);
> +	*ret =3D __dma_alloc_from_coherent(mem, size, dma_handle, flag);
>  	return 1;
>  }
>=20
> -void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t
> *dma_handle)
> +void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t
> *dma_handle,
> +				     gfp_t flag)
>  {
>  	if (!dma_coherent_default_memory)
>  		return NULL;
>=20
>  	return
> __dma_alloc_from_coherent(dma_coherent_default_memory, size,
> -			dma_handle);
> +			dma_handle, flag);
>  }
>=20
>  static int __dma_release_from_coherent(struct dma_coherent_mem
> *mem, diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c index
> b0038ca..bfea1d2 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -272,7 +272,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size=
,
> dma_addr_t *dma_handle,
>=20
>  	WARN_ON_ONCE(!dev->coherent_dma_mask);
>=20
> -	if (dma_alloc_from_dev_coherent(dev, size, dma_handle,
> &cpu_addr))
> +	if (dma_alloc_from_dev_coherent(dev, size, dma_handle,
> &cpu_addr,
> +flag))
>  		return cpu_addr;
>=20
>  	/* let the implementation decide on the zone to allocate from: */
> --
> 2.7.4

