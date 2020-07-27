Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9649922E4B1
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 06:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgG0EUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 00:20:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:16590 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726064AbgG0EUp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 00:20:45 -0400
IronPort-SDR: 4AVeO9fLnPlvMKQHORZrEHuv2ze6VCk6hbaKUplXth31h5pMp7I0XZWNjGwQZM8jTb8iC3wap5
 M+ZC5IfvpCKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="152211457"
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; 
   d="scan'208";a="152211457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2020 21:20:44 -0700
IronPort-SDR: mg3JQH3bR2uhhUU8/jHk4daeiMIGYdyrx46uQK33jmdz6D/vJn7Dk3e6s5GVdKxOZbZXoOrPxJ
 4urs2BKTq4Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; 
   d="scan'208";a="463926862"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2020 21:20:44 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 26 Jul 2020 21:20:44 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 26 Jul 2020 21:20:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 26 Jul 2020 21:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUz94BcSDZw+Ntb+cT8v57Cihb0efpbTDTMRHoCD3L7Cs+LQf2UVxGBDC1c7xkpZ8XQQ33uXD+gS+1jvRFPZB4c0j/afuA4a5jMuNNel7OD5nV/w/lpuVPTtovrEV3zD0Wg7WNdHFQHL1R2F0IaY9kB+3OR6qxAB8F4FE3ds968ZbRwZOS1Aq3lOl8r/Ay+DANt+LNYnd0DdkyJ7pEiS+2J0zC1/x6oKnyLN7wGBfJwNuRtHl9ioTp4NDv9PeYZ0RqfVUcBnFY9RBKvlDwnbrvIqAEq1iyF0pJJDHsTxPNe8UvpT/O8j5N+0xLQ2Ts4g5qFbRuLRY6YtkUsBECZpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZXHbB2FS1wWC7aguPIhB4Y9KgJRJn0lljIvglWb1CM=;
 b=nykcrv6MR6fJmuR/Er4PR/QDrFYj0BssU167LZEP/SMjVrRB2vlq4cJN/UGDVKNEk9HxL+C4/paSKJajclj0TF9x/WAe6ujWOe6NL/OsjpRRtyJi3VZRtlmd411fTkx25pTrX+OcEEsuaMo0PfrUTTV8p2u87R1MylBM9h+9wKRv3fWUDCELWYYsqmmx52Um/mOZhwpmGROpyaWadEwDFDrWrbu08Ye0DwlfLjCy0tEK+R4p+LPiovuqOq7N/IUzs2SrGZdRL6KkhGebFG4EWxKWSFm/dZTpCdFc36Kx5w/eCcI5pFZp+luXEP5T6CZtncFnM+A2G6gHiCejq7a2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZXHbB2FS1wWC7aguPIhB4Y9KgJRJn0lljIvglWb1CM=;
 b=eAdIveOTzUzRNxDGsnVi1RWXKOPxYcZw8dR1AjNymlIlqd2AMtyG5n4mTG7i5nCmgEUPcpyRdWdLBbDvCc+LGTLObD94tzG8aClKX0gQWtcdrlxqtbuO2MKzJYLAFxCMRzGlaW6CZkCDKLFmkoMeaasIZm6A5idzsVcSSa5kfkI=
Received: from BL0PR11MB3028.namprd11.prod.outlook.com (2603:10b6:208:7a::10)
 by BL0PR11MB3332.namprd11.prod.outlook.com (2603:10b6:208:6b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 04:20:40 +0000
Received: from BL0PR11MB3028.namprd11.prod.outlook.com
 ([fe80::92e:d47a:458b:8598]) by BL0PR11MB3028.namprd11.prod.outlook.com
 ([fe80::92e:d47a:458b:8598%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 04:20:40 +0000
From:   "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>
CC:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Thread-Topic: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Thread-Index: AQHWY8xSA7WDcWfT7EGs5zhSWTVff6ka0npg
Date:   Mon, 27 Jul 2020 04:20:39 +0000
Message-ID: <BL0PR11MB3028D74ABDBEBCED28ADFB9EDE720@BL0PR11MB3028.namprd11.prod.outlook.com>
References: <1595823137-20553-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1595823137-20553-1-git-send-email-bingbu.cao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTQ1NTRlYTUtNDkxMi00OGYwLTg2MGQtNDA0OTY3MGIzNzdiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWng5SDY1dHRFbmcxZVNGZ2JZb2xNUUZVM01CR09tYTdLMHFVTDFPZmFLaFdMdWU0ZmkyU3JseTB1VFRUMTFJMyJ9
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92704956-9d22-41a4-7775-08d831e46bb0
x-ms-traffictypediagnostic: BL0PR11MB3332:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB333269959E6FF336501D7C8CDE720@BL0PR11MB3332.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8tJMPJ7MztUSma6Urrz2ArX+VUV9fcdi9qrle/dBkFoHCsFbjzL4f49D02jkBqjPxTLfbmbdkEsYHCpcwmAVIldTrU1CKyj3b610x5ldY+5QFaFPVoX5oMKMf0BF0zVafKtbe5PgoUovSws+t/LcbjaXD1G3AloDHmF1t+1ealb1f4vXofQrTqHhl22BH6euHV4XSyrWwBx/SnNjJjRfEBm8rSs9IFFGkgKWMur0MozFOiAy49IOuJIz3U/o+JIJS2TfOTrcRJ10soxgkSJTNjiXu54nBqiOxNsjcShPXTKPQ+x4P3eBhv3+xTt2jy6y512A5ePe5TcGmN3gdrQPoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3028.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(2906002)(8936002)(186003)(54906003)(53546011)(6506007)(71200400001)(76116006)(66446008)(110136005)(64756008)(316002)(9686003)(66946007)(55016002)(66476007)(66556008)(26005)(86362001)(478600001)(33656002)(52536014)(8676002)(4326008)(83380400001)(7696005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: jQKMfLbDmTAzjIakmjUDHgi9e7dFaeBEFX04zpAM75jObzNZxTJSKhYbFN/rpuVG/maOHInQpTt+IxYjlCkf83re//fYVHIx7Sp7H3Wchy0AzC1JyME02I4cgTKdz63S+gPdI/SIU2KXNeDlSdZrENJOELSbesce3tsKahX9M7h5gKwGmf5F62GP9wEvVBHuLvbOJplEOQAZ9RdGMTo5cGMstjfVL86jgtguoTAwTKr4tcwsYmfKKF1uuTzppJOn7P4yVOnUw2TlgehxmEMTkzFgAHi7V8EmzGvKyPz1dAn5J4WYVzPtBP7E1/QN0K1tt18fv6SDfZ47HEFwF8TjADxNxhERr3TBHoE9s9ixN/e4mfUlmX/yrvWXNFrh8T79UjlwJ3zWoAtwrG7xVrE3JEIkKNjtzXHhw7wB5ix4dP4Xa+RzYJ36xe+Z7SZb/KGC9CpFsV/0gEalvOYMFt+kC0cRVofTMudkubp/DA+KbQZ+V4mZYVKTvsV+6dqs1TM0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3028.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92704956-9d22-41a4-7775-08d831e46bb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 04:20:39.9917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcQQhkYSeZ1vb0n+SfnU2ZAUKh14T2HQJkXra0EqxnB4Yd/qT/Qq0lsCkny+H4tiPTctqi8XHm1LFYVfzOwEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3332
X-OriginatorOrg: intel.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Tianshu Qiu <tian.shu.qiu@intel.com>


> -----Original Message-----
> From: Cao, Bingbu <bingbu.cao@intel.com>
> Sent: Monday, July 27, 2020 12:12 PM
> To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; helgaas@ke=
rnel.org
> Cc: sakari.ailus@linux.intel.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;=
 Cao, Bingbu <bingbu.cao@intel.com>;
> bingbu.cao@linux.intel.com
> Subject: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
>=20
> Fix the typo in email address of Tianshu Qiu and correct the name.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Tianshu Qiu <tian.shu.qiu@intel.com>
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5392f00cec46..638dfa99751b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8765,7 +8765,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:	Yong Zhi <yong.zhi@intel.com>
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  M:	Bingbu Cao <bingbu.cao@intel.com>
> -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
> @@ -8774,7 +8774,7 @@ F:	drivers/media/pci/intel/ipu3/
>  INTEL IPU3 CSI-2 IMGU DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  R:	Bingbu Cao <bingbu.cao@intel.com>
> -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/ipu3.rst
> @@ -12609,7 +12609,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov2685.c
>=20
>  OMNIVISION OV2740 SENSOR DRIVER
> -M:	Tianshu Qiu <tian.shu.qiua@intel.com>
> +M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  R:	Shawn Tu <shawnx.tu@intel.com>
>  R:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
> --
> 2.7.4

