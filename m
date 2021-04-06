Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B553552EE
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343589AbhDFL5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:57:48 -0400
Received: from rcdn-iport-8.cisco.com ([173.37.86.79]:17309 "EHLO
        rcdn-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243397AbhDFL5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 07:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=279; q=dns/txt; s=iport;
  t=1617710260; x=1618919860;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5hD+H9RT3MxfhLNSN8fNxdLmsGQ2aZ9AWgpD1eUkYlg=;
  b=I/hF4diSPMs4gHjNShNua0Wlihfd+HEn2q+uYPwQBRwYb7gtDT8sAKgr
   Sz9DHSvQKOBOSHG04NHxCNeT1CuYG/dF7T8/YlUm9GihVZ8x36UmweRxO
   q/YHoQEntIqHI+HwGvCE2tZSGyiQWikpSGfDGpb49wfaoqMlw5vOn4HI/
   Y=;
IronPort-PHdr: =?us-ascii?q?A9a23=3A7F+SOhSk9bjzGQxYuhSZLgrPRtpso0fLVj590?=
 =?us-ascii?q?bIulq5Of6K//p/rIE3Y47B3gUTUWZnAg9pPjO7SuqrnQ2VG6pGE4zgOc51JA?=
 =?us-ascii?q?hkCj8he3wktG9WMBkCzKvn2Jzc7E8JPWB4AnTm7PEFZFdy4awjUpXu/vjUVH?=
 =?us-ascii?q?hH2Pw1vL6L+HYuBx8iy3vq5rpvUZQgAjTGhYLR0eROxqwiZtsQfjYZ4bKgrz?=
 =?us-ascii?q?R6cqXpTcOMQzmRtdjqu?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AAzcxdKxeS2s8pg3t5G3kKrPxfO8kLtp033?=
 =?us-ascii?q?Aq2lEZdDV8Sebdv9yynfgdyB//gCsQXnZlotybJKycWxrnlKJdybI6eZOvRh?=
 =?us-ascii?q?PvtmftFoFt6oP+3ybtcheRysd07o0lSaR3DbTLYmRSpczx7BCkV/Mpx9ea+K?=
 =?us-ascii?q?6l7N2usktFZysCUdAG0y5SDAGHHkpqACxPApQkHJSRj/A32waIU3IRc8i9Gz?=
 =?us-ascii?q?05RODFvdLGj9bLZhQBCh4h5mC1/HyVwZT9FAWV2QpbbiNXzd4ZgCT4uiHaxo?=
 =?us-ascii?q?HmifG0zRfAy3Tehq43pPLNwsZObfb88fQ9BS7rjm+TFeFccpmjmBxwn+218l?=
 =?us-ascii?q?Ytl7D30lkdFuB+8WnYcG3wgTaF4Xib7B8U53XvyUCVjBLYyKSTLl9Xeqkx57?=
 =?us-ascii?q?5xSAfT6EYrobhHocR29l+ZrJZeAFfhmynw9rHzJmlXv3e0unYrnKoviWVeW+?=
 =?us-ascii?q?IlGcZshLEYlXkldKsoLWbf0sQKAeNuBMbT6LJ9alWBdU3UuWFp3ZiFQmkzNg?=
 =?us-ascii?q?3ueDlChuWllxxt2FxpxUoRw8IS2l0a8ogmdpVC7+PYdox1ibB1SNMMZ64VPp?=
 =?us-ascii?q?ZAfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoManZYIP15l3vJjaSltXuS?=
 =?us-ascii?q?oTdivVeI6z9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGR0spl8emvvUDEs?=
 =?us-ascii?q?zWU/u+I/ttcrreBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OKoCCjJ2eTN?=
 =?us-ascii?q?/jYJ7WVRo0UGL2BXUOGBLpIt9b00ytUnjkxBzYW3bnfF3j7Yt9eZKquNQ7+c?=
 =?us-ascii?q?woDMlhowIVgVO26oWgMjtZqJE7e0N4PffgiaO0pW6/+G7S9GV3Mh9BDkJYiY?=
 =?us-ascii?q?+QEU9ilEsvCQfZYLwDs9KQdSR5x32cPCJySMvQDUpCvVht4Lm2KJaR3CgmDN?=
 =?us-ascii?q?qiPguh/j0ujUPPa61ZtryI5M/jdJ99M40vX7ZpEx7XUzZvnxxxlWtFYAgYZ0?=
 =?us-ascii?q?PWGz/0k5+5hJgMCOy3TagkvC6bZepv7VPWrwG1uNwmTHpzZU/QbeenxSIVAw?=
 =?us-ascii?q?dyqnI02akFm7aEkSuoMgIE8ZoFGWwJTn+WDrJABBmCf6NOlNnQCVlNZFbPoy?=
 =?us-ascii?q?CGgBcufWev0EMeigXaXHepUMCOJEZBsXZF1auvyndITyG2ekJ9bW0Si/wnKU?=
 =?us-ascii?q?3Ppmtz3eiXZqC6zmuWbR8YzvsANSzeCAFiUz9G1pS50gWYly2FEmhjzpIyPv?=
 =?us-ascii?q?bFBLBmaL3L3GixQbf43p0uDrtR/Jx/MsrpvfJOWeWDexWNJDeQMZJh5yWF4n?=
 =?us-ascii?q?IkMjJzsn8qjLfh3wDk9nGx2Do6DeDJKFprA7EdLNf01Rmte9+YlJF4h8kyp+?=
 =?us-ascii?q?2+LyH4bcOH07jea3pbMQzIyFTGO90AuNRRp+Y/pbFzF57UXX/B02xGxgw3KI?=
 =?us-ascii?q?PxmFkFSKp27bjdMuZUDoYvUjMc+kBsmMWELUMtvACzGOM4cF03h3LQPt+C4d?=
 =?us-ascii?q?Pz2MwSK1zEoBG1NUiU8iVb8fuAQjCK0qQCDbksZWtRc0ox5R1Zja6/XpyVDB?=
 =?us-ascii?q?/vce5N/FC3aCDgNLBcTbWIArUWoFJx5cqSk+qeair/30TRsFJAU9Bz2nfiRd?=
 =?us-ascii?q?n3BgSGXfNM+Zi9P1+Hh6Ox+s69jDvtU1KAGjMlrJwAcVZVd9hJjzkpkZY+3S?=
 =?us-ascii?q?ezQLHmu05NqSos3Rh30lr2npW86GjVHUtaIRTUj5VfUz5UKGWJh63+gJ2l/W?=
 =?us-ascii?q?W45iNE15nFHFpRed8LG8F4dPmGExtT?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CYBwBVSmxg/4kNJK1aHgEBCxIMQIF?=
 =?us-ascii?q?HC4FTUQeBUTYxiAoDhTmIUJUwhAeBLoElA1QLAQEBDQEBMgIEAQGBFgGDOQK?=
 =?us-ascii?q?BdgIlNAkOAgMBAQwBAQUBAQECAQYEcROFUA2GRQEFOgYBATcBEQEIGB5CJwQ?=
 =?us-ascii?q?BDQ2FPwMvAaAdAoofdYE0gQGCBAEBBoUdGIITCYE5gnaKfRyBSUKBVoJfPoR?=
 =?us-ascii?q?AAoNKgiuXSAGpeQqDCp0bgzsBoTUtlGijKQICAgIEBQIOAQEGgVQ6gVlwFYM?=
 =?us-ascii?q?kUBcCDo4fg3CKWXM4AgYKAQEDCXyMTgEB?=
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="880703082"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:50:33 +0000
Received: from mail.cisco.com (xbe-aln-007.cisco.com [173.36.7.22])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 136BoX4N020558
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:50:33 GMT
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xbe-aln-007.cisco.com
 (173.36.7.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:50:33 -0500
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xfe-aln-005.cisco.com
 (173.37.135.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:50:32 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 07:50:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+iovfSG9/kgfnYS5wJ20MPHhB11+D0796kjbZh8SHqtfQcCXv/VMerSJ1OZJgsqQo2p8mc3KtxqwHHkdaqvuKyd3E2aIx7FL+dcPocQXc8p3tvEIfboMY0aGws2PeRssGN7dzwlpFo52bGZ417bqNIfFGe/whHXEtzQAbTcqkBvbBmyZVOZJdC4AmpR3Fh1MbOPTYEq1q3Fqy+qSWvhw64OeIquO4+pTlQPvi15AOPel+wUA4tJJdKgu8GOJk8bc0H3kIKz6fUn145bkQOMtKwS6cyu3LGXYLu3x9NdTN3HPxfeYAwgF/nN+pPcyV5ZidvA06PQBXpsAsDLiv3isQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgDZRg3gwt+moKRe+8lljgFEi/5GZXmYPEhU0xD/OrA=;
 b=NLXMOYr1+55iaC1LFDjqL3cIF0u3TeXylQ6A/Hvt9B3zrmb570Vg9wLTx4anKXdK+FnCW6xSonfFbZlF0AigudW3qMePwgoEUzR7+54fU0Uath2w12W+uvhzhZ9OexW6poMCTdSMX94PG/ZFZo1VyM1aKOHDZoNVJ1cw05JPHOEiWABi3GmHV5WFl5F/r1HY/6ymX/zdYd1BDYIREAEBiFbg5/Bfe1SgBM/s62L2oel8ddPLYQD20EOqb8YTVBE12mvfSNLKUQdOQZESdD+nsnXbSrWUx6JGlWolTAxNlgkLNCxMyH2zs/Nckusmko3AHpuq0zdNQHbSJSpplEbPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgDZRg3gwt+moKRe+8lljgFEi/5GZXmYPEhU0xD/OrA=;
 b=dNssfSVPJ58kMf2uX1Xq7en0ZkUiODHA1qJvaEscLca+LmzOKGlq86YUwv4tjIR0PVjUey8FxXU/bdOfpZjjk+AtyYUZEb9U2EnwmO6JJ/e1BBhPRXpYHhLjIwCD0t3LWogZl2pjzmB7jVuvTcLTDoRLuAuDGYUZHyx+AKGDs5A=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 6 Apr
 2021 11:50:31 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:50:31 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 10/13] media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE
 control
Thread-Topic: [PATCH v8 10/13] media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE
 control
Thread-Index: AQHXKtsLFQzYiids0U+maVpg5vbVDA==
Date:   Tue, 6 Apr 2021 11:50:31 +0000
Message-ID: <DM6PR11MB4625C4EB934A4430F9C11D42DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dff67bd1-fa4a-45de-9637-08d8f8f22e86
x-ms-traffictypediagnostic: DM6PR11MB4692:
x-microsoft-antispam-prvs: <DM6PR11MB46927E55C7BC779C308B9AF4DE769@DM6PR11MB4692.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xul7sbkixiMflL28ydcrW2kVP339fc6CRGg7uDzEaDjv+WlM+LryoKxg/yYi9o4pjJpmVCvsfA5gIIMJjnE5KZiLe6b/bZpq7Wrw/l/oFPkJba8nZeG9LBmK4RTXNXA3/qPh2dP40q/u+hKASsstNFYYGIlCmBiHxr2yTFpSWBOfrrruGgV4Cc3NUU7ISbo1JXdfv3i557ez/AHdOws9NDGSAh+l4chL9x1B4S12ntad1T6ay79HHo1fF7oWaaK4rI9CrOKvQdiYQLvH4NqEMhEaLIvkGpqTLeOpx49588Ru78o6qAgoRPwQYVJZnDIdNa+bFiCpdlRwaiGmKhpk2X14dSXG6x/2YqIhmy0yXkmVuUwcC04bM7AjVT2Y6Te7zfz2AZMt6xADRSxY6s2MJCZDsL6x6tyy2wLnZQ2XavpqgCnMLDAsNeoYqaot4zpzudh9sYZ7J70p4KPa99Wlg+8qqbMr/vRYMfB7NnOu9TzG7FHKXUDFpQDjLQJ9bcAcnjPcBryVdi4VFVQt9Jg3yo8G1mwhtAxcGLekuTJm+ubY0aylFmnQaOgTHKVE0087XNcmMK38WLtadd1299NI5grgXCC+f+tpykgFxNEQZCGUPguwlOwqEoYdKExrDRajmQvriCJF7ZYYHriUQs0JvWGPSdUX3mMY5BcHDaNAdR0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(396003)(346002)(39860400002)(110136005)(53546011)(86362001)(54906003)(316002)(6506007)(558084003)(7696005)(38100700001)(9686003)(8676002)(186003)(55016002)(8936002)(4326008)(478600001)(2906002)(52536014)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(5660300002)(33656002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UqCaJlXRB/0lsCR/8+twEF558c+xBEjY3ul3bLScq2U1v4ixVhNSzkho/mAI?=
 =?us-ascii?Q?EL5ZrnS0yT/sC92NEdoULhCuEaCWbLHOsrnibTPBh/lqkETlcAyXLTMcWbFc?=
 =?us-ascii?Q?Pjt193P0vYT98xwQnBaAkVxDj1qYstlBqOzYJ+yJfEnfVB1jt02TquhUV7hG?=
 =?us-ascii?Q?9yWYFJRewG51Gx8X2l6OEdTLzSIIAk1VSuR+qtaU+OmIzWCvL/E4MWbKceo/?=
 =?us-ascii?Q?5LW9giLsT239ugUNavpqP2xZ8qdFBD9YNxunMOlRRA20cfs4s7FDbNKb8u4S?=
 =?us-ascii?Q?PWhwyUL+8WJVekf2SGTuDFVDCtKrvOv9zrqOfi0/TVA9MQe9u3jgOA6IU23H?=
 =?us-ascii?Q?X43tw3wwTHgXjfZ7pAPKmTPlaNI/ltfGQ3wUG5NviWbKweHTgCTKtRmYahK+?=
 =?us-ascii?Q?9vvMQx1/+oYj93FobZ8tLG29lukbmRa1rB6s69Iwuaz2jiAS3yn9vfzhg7j2?=
 =?us-ascii?Q?5bZZZyxet1fQ4CSW6ePup/JUjRLXZGGAeqRIeauHxixVSeeBlicXXFrEplor?=
 =?us-ascii?Q?heIdx2PiHmw3punbjtU+VoG8Ek3rvnR6FNpdADsAZucxQFQAwMi0V12AjP5g?=
 =?us-ascii?Q?YN7EgBZzsDqdXIq34n/wPD4E86ZD5oMSXaYK5Vh1oWbQ/371v4rVHjoB7sqg?=
 =?us-ascii?Q?cOpIrwonTkdS62xYNWfP07tn+VPeOKRPF3bQW28aB7une4bkffePv0SiOw7D?=
 =?us-ascii?Q?LTm6l3Bks+pV0bOs4wlQlg8CbKoi1M7/my+NCTX+xwPaJ1YK5JBzmkPVFHDS?=
 =?us-ascii?Q?lwrJ6LU9FChccaxpvhLq83SoACQ6pnvXcXBGBQD9Spjrj02q0NtrFjmoRLEd?=
 =?us-ascii?Q?x8Rg/YyXD2gddfHUtZnnBnlA/jHh5SsLGJdLruQhYLxKU/aqUlFBeyi3Rdvm?=
 =?us-ascii?Q?RmWbcoBTtotrdvomKoo6OfZttqGng2hAiXVz9C6s492T5j5VI63ePeIEXoIt?=
 =?us-ascii?Q?RLK1+ikvO5c7wUvgPOCCrQd4OVvayWme2FnZ14injBDX+c794/L4MX/634Y2?=
 =?us-ascii?Q?mgD+cwAn0qQ+72iMoNRPa28d681Rvc+sMy/LOKJQEe7E+/r40rdPebS0LE8P?=
 =?us-ascii?Q?mQ74qRHhY6jbKcBd+fbQgGXLY82/Tz3tculTQTeGkDRN5Y/Mmzija11bhNHS?=
 =?us-ascii?Q?Vg/AZPycn9T38+TsL8DPJs/r8u40RucP5UNM9gu40Pz8DmGcLB6whbBb3ASi?=
 =?us-ascii?Q?bEvIbFIHL/kEdZoYqR/whNsupXAnlywFoJbEPHHV3YY7x8Cc/6orT9t2lzsF?=
 =?us-ascii?Q?yKMC49gP6Yu5lceSHua02QLqr/CPslrqcgHfzRU3O4jLpxTxqFNJO0MlKy2Y?=
 =?us-ascii?Q?3eTILtGjc98UwPrerSQ7hVeH40it5D8tX7PzZ0DPWvR4J0U8wam8dtiaNIcC?=
 =?us-ascii?Q?aY4hubU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff67bd1-fa4a-45de-9637-08d8f8f22e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:50:31.8216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cF/wTR2urVsmHCTYKJoeuUabsp9vyi5mpqouwtdNVpsNmGilTmjOBfsAqqHZLWDOJdyG1uTa01SvGKqBPNIPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.22, xbe-aln-007.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 18:00, Benjamin Gaignard wrote:=0A=
 > > Make sure that V4L2_PIX_FMT_HEVC_SLICE is correctly handle by v4l2=0A=
 > > of the driver.=0A=
=0A=
Make sure that V4L2_PIX_FMT_HEVC_SLICE is correctly handled by the driver.=
=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
