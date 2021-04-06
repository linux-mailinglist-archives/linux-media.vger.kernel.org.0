Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D62B35530B
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 14:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhDFMBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 08:01:05 -0400
Received: from alln-iport-1.cisco.com ([173.37.142.88]:21230 "EHLO
        alln-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDFMBF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 08:01:05 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Apr 2021 08:01:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5276; q=dns/txt; s=iport;
  t=1617710457; x=1618920057;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8cWxG0qVb9JBY/G61W7vHQgZkegROuMzBMnqQxqufB0=;
  b=bD5FkqF99Xt4H0LHYHTSn8yvXtAtg8roAfKUM7EWPiVu0fRz9/N/DMwX
   z3ROS+DuPJSbco9Buz0JHqx5urieYTfRF4xYsVlmTKKWLcNGcbnsfqkUo
   w9eGZ+/EBtOnb+1/3Ca3DIQ3RB7c50vn4uDM8zjmNr/rZ6qNAikPpjIwz
   c=;
X-IPAS-Result: =?us-ascii?q?A0AYAgCHSmxgmJFdJa1aHgEBCxIMQIFHC4FTUYFYNjGIC?=
 =?us-ascii?q?gOFOYhMA5k3gS6BJQNUCwEBAQ0BATICBAEBgRYBgzkCgXYCJTQJDgIDAQEBA?=
 =?us-ascii?q?wIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAWiFUA2GRAEBBAEnEwYBATcBEQEIG?=
 =?us-ascii?q?B5CJwQBDQUIgmmCVgMOIQGgHgKKH3WBATOBAYIEAQEGhR0YghMJgTmCdop9H?=
 =?us-ascii?q?IFJQoETQ4IwLz6EQAKDSoIrgkoBYC4BgTBUkVyLYZ4nCoMKnRueZoYLlRWjK?=
 =?us-ascii?q?QIEAgQFAg4BAQaBVDiBW3AVgyRQFwIOjh8Zg1eKWXM4AgYKAQEDCXyMTgEB?=
IronPort-PHdr: A9a23:vHejfhfa+TCFQ3px1i6jmLgMlGM/SYqcDmYuwpM6l7JDdLii9J3+P
 UvZoO9gl0LNQZ6zw/lDj+7fuaf6UCoL5pPS+HwBcZkZURgDhI1WmgE7G8eKBAX9K+KidC01G
 slOFToHt3G2OERYAoDyMlvVpHDh5jkWHhz1MhB8YO/yH92ag8G+zevn/ZrVbk1Bjya8ZrUnK
 hKwoE3Ru8AajJEkJLw2z07Co2BDfKJdwmY7TW8=
IronPort-HdrOrdr: A9a23:agtO461BcVmyplAzm+UIbgqjBeJ2eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/9IyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmNJ1/Z
 xLN5JzANiYNzdHpO7x6gWgDpIEyN6I7KiniY7lvgpQZCtBApsQiDtRIACdD0FwWU1iDZ02CJ
 KT6qN81kadUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0Lm1JfRFR+E0hACFw5e2LtKyx
 mIryXVxIWG98u6xBjVynPJ4/1t+OfJ59NfCKW3+7MoAxr2jALAXvUFZ5SnnBQY5N6i80wrlt
 6kmWZvA+1W52nKdm+45TvBsjOQqgoG0HPpxV+GjXaLm6WQL1hWZ7sj9OBkWyHE4EkttswU6t
 Ms40ultoFaBR6FvCPx68mgbWATqmOIoGEvmeNWsnpHUYF2Us4pkaUj+ipuYfM9NRO/zLpiPP
 hlDcna6voTW0iddWrlsm5mx8HpdmgvHz+dK3Jy+/C94nxzpjRU3kEYzMsQkjMr75QmUaRJ4O
 zCL+BBiKxOdMkLdqhwbd1xAfefOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWMdIEXyoAx3L
 DMSklRu2J3W0+GM7zM4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDF80lc+tpOgeH93bV/
 6/NIk+OY6nEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbo3m39arNMr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVzUU3PpcUrv4IJoHMHhjq8u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66ilLi6q2mw9WPB9H5oJRJZE0ZQ7NzbIjF3jD5PF3mxXacIut2Zd2wX9mCAPAVDQ8TfFx
 Mau0564rutL5ubxTkrDtWuNm7ytQpUmFu6C7Mn3oGT78bsfZ01Sqs8UKtqDAPRClheggBxsl
 pObwcCW27SHj7jkr+ekZQRHe3THuMM2TuDEIpxkzb/vV/ZjdwzTnEbNgTeLvK/sEILfX5ooX
 Fft4UYm6GNnD6zL3BXupVHDHR8LEKNALxHCwyZYp5zgb6DQnApcU66wRqHlho0Zm3ms2IVi2
 CJF1zPRdj7RnxAp3tfzqHmtGlRS1zYVUdxZndm2LcNTljusmpv0OONe6q423aQbFxH2e0GLD
 TZe1IpU3JT7sHy2xiPlDmYE3I6gp0oI+zGFbwmN6rew3W3NeSz5Oo7Nu4R+JZuL9b1tOAXFe
 qZZg+ONTv9YtlZkjC9tzIgOCNurmMjnu6t0Br57HKg1Hp6BfbJOlxpS/UaJN6bhlKUD8qgwd
 F8jdgvu/G3PXi0YtmaybvPZzoGMwjNuweNPpUVgIERubh3uKp4HpHdXzeN3HZb3A8mJMOxkE
 8FWqx07L3IJ4cHRb1ZRwtJul4y0NifJkoitQL7RvUzelwglHfXNdKE6bigk8tYPmSR4A/rfV
 WP+SxU+PnIGzaZ3bkBEqQqPCBYblM/5HkKxpLOS6TATAGxM+dN81qxPiXjLPtTSK2ZFa4RqR
 g/6deShOOTfzf53geVvTYTGNM9z0+3BcepRASLEqpU9tb/P1KGiK6j+tSygzf6UiHTUTVuua
 RVMUgLKt1egTwjhpAt2ie8Sqbrslso+mEukg1PhxrowMy6+2/VEkFNLB3BjphXVTdVNGKUjc
 6ty5ns6F3tpD5f2ZfCE09MftZBX9gIJ7KHXxtTFQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="671736005"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:53:50 +0000
Received: from mail.cisco.com (xbe-aln-006.cisco.com [173.36.7.21])
        by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 136BrorK009853
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:53:50 GMT
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by xbe-aln-006.cisco.com
 (173.36.7.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:53:50 -0500
Received: from xfe-aln-002.cisco.com (173.37.135.122) by xfe-rcd-004.cisco.com
 (173.37.227.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:53:49 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-002.cisco.com (173.37.135.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Tue, 6 Apr 2021 06:53:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+DAD9cFma93YJAghUzz54PRHAQ6ty7Bb24RkhQGVItHvw+yTgVgFSm89P7k5FUIkpKkRukAVAhQAPJ2Lk5xIJvjNHK6OX4534MLkPAJqpGybex6yYS6Hl+m5sTCduFetta6+NNL6iIyu/PPgu72q3bfIsjA2ooNw9kkM3XKIRD9Zsxs+adegGx9ZJwiR3aV+GpvUYuQbwf19iDU4YWrTJGSLXdtA0s8fgv8p/wsO144f7aFjJD8kjjDI0mVzRrSohJ5MIMjAiZNhqgGdUknjs/s6nhummfTtVKAwmxEgFk2ZKMW/Fn40A68Rqg0i8PqV7prNrXXjQdg4U2sDsYtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xh3/qAARb5Qv+euDB+1zeAAa1SvAPob2Gw6i5J7IKik=;
 b=g7N/HsbSpdEbhK140J8DoU8BnehsJxIwLcDONbalihX1qwuOp3kG3v/Qdok9KFVLUpx/GIROSntyrnVDogcV6t8iBvCkBx9EsUm87TbQdO3ZBqJ/t/DppA7cxNZ957K7unJIGb9PKPOUvzdMSiDKjsE2JAOeeB4SFF+D7iBGc3Hwhfd4vMOCibaFHclVt/N5BvjJgNdCOgpIT8T0WdU6VqsOlSM30FIdqj2KCrQKAYw9fgtG3k5lt3+Eb1u4WyAWoiI99cWYmU8sMDR+oS9r7uyE1l1f+l3Xt2KJ63z3aTsQzeA+V3pDE0b5wSh6mB3cXUSeEVhU7LYj2GA3F1Npag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xh3/qAARb5Qv+euDB+1zeAAa1SvAPob2Gw6i5J7IKik=;
 b=A+qlvm5Q7Du1hk+5YSfd+a4cAsnFquO1mAAAXDt6aLi3OkYdPVnLAxyx12NAdSV88wuCP1B7+RI0+dzvNFC24aVdYKNB5Jy0ofCgnk9lMt1uP5l1KbQjl+UvH6jWg19+xxzxdHrxwza/yIoBllwoToEIglYAx1ijZ6sGapnuD5U=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:53:48 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:53:48 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 09/13] media: uapi: Add a control for HANTRO driver
Thread-Topic: [PATCH v8 09/13] media: uapi: Add a control for HANTRO driver
Thread-Index: AQHXKtuA0cpvuvk2r0+aZnlL/JL2UA==
Date:   Tue, 6 Apr 2021 11:53:48 +0000
Message-ID: <DM6PR11MB46257FC8C4B206394BA26FB7DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f1ad54c-b324-4b4e-9d8a-08d8f8f2a39d
x-ms-traffictypediagnostic: DM6PR11MB4595:
x-microsoft-antispam-prvs: <DM6PR11MB4595EE4402031144ED6AE327DE769@DM6PR11MB4595.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wnDq9u3RLdMGX3S8ufr7udmlznYSXHlMZu88GhnRpLOZMO35c/0tQxaG8cGE7KsdfXfPQ5G64JnMZAamZUMpRfqxv/6RiMsg5UMirIFFfCM6YNQ+/V4TgL889gyQ/MpWOGLMSR2FPiC1OfmTeW7yRZZxnzUJAxCtKgXjlzEAfU00mpgdE+FdGj3hd/6bgHvbBxMgHOXf5wHAvC/NzoDZ1nomOSsf1qmlef8bSRK2Fz982YFXRqLyeaHMbb0OkETFH6RV0EgSoJM5bF6jd/Wvg3n3l6FdtvD46kJiF2dZHtNPeP9JHJRzm7cPQCTL0GourHA8pfguTWLt1c2hs+GUeozTyxjUmtmExTkt/xNIUV3GWst88sFXc7v7YnrpewEMlRrakEkbbp0V+Pd5BAFqlScftRrz7YMLysu3Rp9Gm2gLYqvg16u6dOAMemhgnmEt8qBl3YYJWLP9VPTy0JAOHo2ulhv1XLBftqVzZez5YOQR4dBZCftrfUOOZUG52mAdVyzlS+Ok7WzNR9UrIIiyVrGqK2E/5eKollAGydx/4cQtQAw0ea0wa4hYO9FBI9PTAnuEdE/am8ddeeqm3oIZXfvS7MgyT2VR7tJ+mx4lrNHjKRxtzSASD4mcaMnkhycLnVo+d5hZmuBRPvXwIj9W/WpTcDqgJmdhGqIX9XLSrn8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(396003)(376002)(136003)(53546011)(5660300002)(76116006)(6506007)(54906003)(478600001)(110136005)(7696005)(186003)(91956017)(9686003)(55016002)(86362001)(71200400001)(8936002)(66446008)(66946007)(66556008)(64756008)(316002)(2906002)(33656002)(38100700001)(66476007)(52536014)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4Tn0Ds2HtQkjhXbhKjA4WePnPK44KOWfSFK3qfqfVkCVZnTC1qhbpys1kaPd?=
 =?us-ascii?Q?D0+OjzKYBgJUyHKtAhffLhW/R6BXi+EROX31Vv8UU6S/VLDadsaIys9v/UM9?=
 =?us-ascii?Q?TM2sw3PXlOdbSt4Kw98f+l+ui6NAhi+q64U+1UFtW426i+rSr17eo+Gl2FZw?=
 =?us-ascii?Q?Yb/8mYnqMUZwf2zt9Fqz94T81IFs63p/zswWUU13rmkZyZY3r8QzQkwvQyQw?=
 =?us-ascii?Q?EJcBOAoAFb0DZYIdS8tO7HAd0oBVd+An4F/c0Ro2P4j/tAWvq7PyrfC9smoO?=
 =?us-ascii?Q?Z9K/4eR0P3VcWE3gJsh5bCLjm0+ZCU/Sd1Jk8Yi7zkVzMpwuKGh/6cFoiufV?=
 =?us-ascii?Q?50XDGcUEE4sIdFLeyINSv0sM6AqJOOkJxbG4iJJijP8XkHxBrzVQ1RyeGbUe?=
 =?us-ascii?Q?T+II8An4B99B0LWZ0Qs2gG8aXuxOP8UqbARhn/wA+hCOqGaWVrxaiqVZQf5I?=
 =?us-ascii?Q?3JXvKzXsa8v5KiBUMcUo9kjH0js6K0jmn17nF8mBjXEa/pXxIwhSYGSAq/cc?=
 =?us-ascii?Q?LTvrLWZB98ygWFDllEjrrApNM0Tr1bvLch1udB54zBLUjVjt/yuD/fQfvPHO?=
 =?us-ascii?Q?e8hgKAMtcaDL3qipdIqLe8rHRj7ArPnUNYc3X9+QhRJgkEeTA6pVCDD55p+U?=
 =?us-ascii?Q?pnF/gl8wTDUJcLB7BF+b7nr289KU21o6ASeDqUXX47/Wc3X5pDGGuXH+D8PG?=
 =?us-ascii?Q?JlDpkFZhTXdPg58PvjAVxf/CooNygGvjACvRjsygtahh6VjQ1uMCh4NMzwSs?=
 =?us-ascii?Q?GCYxoPKrGGDTQMjPr8UkBuJpICUOvnOE2v6II3/R6ESWkOxiSn7MVlV7aU65?=
 =?us-ascii?Q?21wM0iTwi2FxtDus42VUM8qtnGqUshM6UWWyCeFhXSbjNsAqRxbPPTc2oRCi?=
 =?us-ascii?Q?TrkqVJbjMqdTwt1FVtsVz4Vji+tXAXH/r5ZeABrTe2m8uGPWNVd+uDjaclFl?=
 =?us-ascii?Q?C72zwPaAkWT3geiyTbNDBqx2j26cbXR/kak4K7UTuGVu8rUduR9cHXXHJx1j?=
 =?us-ascii?Q?GhYfrOq91KK8woHWKzkhWwK1s34rxup9QcnFG29xj7SONu2rE5bdGnUjfszn?=
 =?us-ascii?Q?ePkFIzTYtDq3oj6GVFQitQ1vZnHSWSB1SimUeDud7EKHX1216g2WYelVo4zu?=
 =?us-ascii?Q?Sb+PE87/Cze7jasg9u674jTpqTbDxxmoYd0ER1O0h/4QutPQo/niQ67QRY6C?=
 =?us-ascii?Q?JXKpzQCsDZiEw3mA/lEuyRy8IkLsRlrecrD2UZVsPxt+PAZnfJYM6PuJH+Nv?=
 =?us-ascii?Q?s5rk93H1QO2ZIiyDi3QCgpXWjsEIYgADA1jsEw17pAn7DNXJA6NEao5xrtn+?=
 =?us-ascii?Q?DlBsdZTmlHFpYABM9KW7qtjDG4SXj7biZHc61RI1yg9TrTdHOTINNpn3mUJL?=
 =?us-ascii?Q?6US4w6c=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1ad54c-b324-4b4e-9d8a-08d8f8f2a39d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:53:48.3137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTFwM7BqeA3geY+R044hA1tEYgcT9uFIGaldhZ2VrasRwYWoXg6BriOO9K28H77NgZ0G2L5My3KwrdShiE5xdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.21, xbe-aln-006.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:=0A=
 > > The HEVC HANTRO driver needs to know the number of bits to skip at=0A=
 > > the beginning of the slice header.=0A=
 > > That is a hardware specific requirement so create a dedicated control=
=0A=
 > > that this purpose.=0A=
=0A=
that -> for=0A=
=0A=
 > >=0A=
 > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>=0A=
 > > ---=0A=
 > > version 5:=0A=
 > >  - Be even more verbose in control documentation.=0A=
 > >  - Do not create class for the control.=0A=
 > > version 4:=0A=
 > > - The control is now an integer which is enough to provide the numbers=
=0A=
 > >   of bits to skip.=0A=
 > > version 3:=0A=
 > > - Fix typo in field name=0A=
 > >=0A=
 > >  .../userspace-api/media/drivers/hantro.rst         | 14 +++++++++++++=
+=0A=
 > >  .../userspace-api/media/drivers/index.rst          |  1 +=0A=
 > >  include/uapi/linux/v4l2-controls.h                 | 13 +++++++++++++=
=0A=
 > >  3 files changed, 28 insertions(+)=0A=
 > >  create mode 100644 =0A=
Documentation/userspace-api/media/drivers/hantro.rst=0A=
 > >=0A=
 > > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst =0A=
b/Documentation/userspace-api/media/drivers/hantro.rst=0A=
 > > new file mode 100644=0A=
 > > index 000000000000..78dcd2a44a03=0A=
 > > --- /dev/null=0A=
 > > +++ b/Documentation/userspace-api/media/drivers/hantro.rst=0A=
 > > @@ -0,0 +1,14 @@=0A=
 > > +.. SPDX-License-Identifier: GPL-2.0=0A=
 > > +=0A=
 > > +Hantro video decoder driver=0A=
 > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=0A=
 > > +=0A=
 > > +The Hantro video decoder driver implements the following =0A=
driver-specific controls:=0A=
 > > +=0A=
 > > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``=0A=
 > > +    Specifies to Hantro HEVC video decoder driver the number of =0A=
data (in bits) to=0A=
 > > +    skip in the slice segment header.=0A=
 > > +    If non-IDR, the bits to be skipped go from syntax element =0A=
"pic_output_flag"=0A=
 > > +    to before syntax element "slice_temporal_mvp_enabled_flag".=0A=
 > > +    If IDR, the skipped bits are just "pic_output_flag"=0A=
 > > +    (separate_colour_plane_flag is not supported).=0A=
=0A=
Since the driver (and esp. the HEVC API) is still in staging, I prefer =0A=
that this=0A=
control is defined in include/media/hevc-ctrls.h instead of in =0A=
v4l2-controls.h.=0A=
=0A=
Also add a note to the documentation:=0A=
=0A=
.. note::=0A=
=0A=
        This control is not yet part of the public kernel API and=0A=
        it is expected to change.=0A=
=0A=
 > > diff --git a/Documentation/userspace-api/media/drivers/index.rst =0A=
b/Documentation/userspace-api/media/drivers/index.rst=0A=
 > > index 1a9038f5f9fa..12e3c512d718 100644=0A=
 > > --- a/Documentation/userspace-api/media/drivers/index.rst=0A=
 > > +++ b/Documentation/userspace-api/media/drivers/index.rst=0A=
 > > @@ -33,6 +33,7 @@ For more details see the file COPYING in the =0A=
source distribution of Linux.=0A=
 > >=0A=
 > >  	ccs=0A=
 > >  	cx2341x-uapi=0A=
 > > +        hantro=0A=
 > >  	imx-uapi=0A=
 > >  	max2175=0A=
 > >  	meye-uapi=0A=
 > > diff --git a/include/uapi/linux/v4l2-controls.h =0A=
b/include/uapi/linux/v4l2-controls.h=0A=
 > > index f3376aafea65..1dfb874b6272 100644=0A=
 > > --- a/include/uapi/linux/v4l2-controls.h=0A=
 > > +++ b/include/uapi/linux/v4l2-controls.h=0A=
 > > @@ -869,6 +869,19 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {=0A=
 > >  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC	 =0A=
(V4L2_CID_CODEC_MFC51_BASE+53)=0A=
 > >  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P	 =0A=
(V4L2_CID_CODEC_MFC51_BASE+54)=0A=
 > >=0A=
 > > +/*  MPEG-class control IDs specific to the Hantro driver as =0A=
defined by V4L2 */=0A=
 > > +#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200=
)=0A=
=0A=
Right now the stateless HEVC controls are part of the codec class. Once the=
y=0A=
are finalized we will move them all over to the stateless codec class. =0A=
So I think=0A=
keeping this control in the codec class is correct, and when HEVC support i=
s=0A=
finalized then this hantro specific control can be moved to the =0A=
stateless codec=0A=
class as well.=0A=
=0A=
That also means that the note added to the documentation above is =0A=
correct: at=0A=
that point the control really will change.=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
 > > +/*=0A=
 > > + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -=0A=
 > > + * the number of data (in bits) to skip in the=0A=
 > > + * slice segment header.=0A=
 > > + * If non-IDR, the bits to be skipped go from syntax element =0A=
"pic_output_flag"=0A=
 > > + * to before syntax element "slice_temporal_mvp_enabled_flag".=0A=
 > > + * If IDR, the skipped bits are just "pic_output_flag"=0A=
 > > + * (separate_colour_plane_flag is not supported).=0A=
 > > + */=0A=
 > > +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP =0A=
(V4L2_CID_CODEC_HANTRO_BASE + 0)=0A=
 > > +=0A=
 > >  /*  Camera class control IDs */=0A=
 > >=0A=
 > >  #define V4L2_CID_CAMERA_CLASS_BASE	(V4L2_CTRL_CLASS_CAMERA | 0x900)=
=0A=
 > >=0A=
=0A=
