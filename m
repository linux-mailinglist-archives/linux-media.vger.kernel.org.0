Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F027E76E3B2
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbjHCI4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbjHCI4B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:56:01 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E18C1712
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691052955; x=1722588955;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zTq2TtwK3iqwhR5DXQTGgn9/JjTeNJwhmHO8PmIVOcU=;
  b=JzyPKLzcAvMoicqkei9Xm16UTy7ne5Lkgboei63hSRb0rN4QTKt/tvaQ
   lp+3WiipbWLQNooMj9bvfc4LdRK/CD9dehvYZqjnxwuC9WMncevL4L2CJ
   pEEXSR/novBt4Px0kwWhzBl5JW0cR8p1BSnyXzLq0wzRD3jaBl/XugY94
   1/HK/Fyb9Ha7/2ZmrDIlDn8Rv3hvwRbFPZ6avosSQMQLSjMTCUlXBQgkv
   05HZUqYbaSq/dZdJolg3mghRPYPOQQFuheoFGB0R7j9dZZPfOUGwrDwIM
   0n1RxQx+f0zuxYHtfoNKuZBNbaxy/Q8fIKov7bDyrnVbfAMLfSr+IYyKS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369810214"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="369810214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794910491"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="794910491"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 01:55:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 01:55:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 01:55:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 01:55:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 01:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSO/gc3sO7VyHW303toN5ZmpAWHexJVGrNOPpYRHJ8gZmQwSL/MeS+J1PrrGihAQk3RE1X2m/pwKUfq4aihUJ5+q5MoJJozNbZnM806/UNmhUveD/22lsajyFcNaUOyZZIB7Ukb1JqbUVQ3naKIHVKBTmnLUKV527TBdpUJ9SgZXSAN6jj6x8jggFfJ/fgoOiVGv+sKbacfpy9lzbH6U7uFe87yeOfYD5FfJuT4RlOr6oIkd/vnZDnC1D5cApe4wQM8QHy6leam719qZ33wy6qISglNDkxh3kHvyNIAd4/pT9Fmmo7JhssILgdJD5r806fVlpIgiLalAy/QDYLDLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTq2TtwK3iqwhR5DXQTGgn9/JjTeNJwhmHO8PmIVOcU=;
 b=DGNJQcjATuzi99GF3ma0lAflU9WsFABEnkit1xjgGvl8chQStic5P6DeTmzentMJrlQ8hTRHCQtfUdU2G8hOnQlFkmLgHx7TqgedshNE2daH6vUjaossE1T10q7s7TksQQxGkThfc93IWT4Cey9maIFHUB0EeGZdskkA3ZkT1Ly5dFlaYTD6g/8AdOe8CA/CuzvvIcdCJfaIP5x4GjUIuHPw/Pa9tPp5OQxaUPmOd4zSr43jQFGDwWGEmMVZjME4jhO7ofOB2Xohjl/xAFL1JsstQAFxCjbV6T0gQ9ajL4NyihsyBkMeILbJYO1P+G6ixxD9RmYFTOaXtYX6vRylhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:55:50 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:55:49 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v1] media: pci: intel: ivsc: use new v4l2-async API for
 mei_csi subdev
Thread-Topic: [PATCH v1] media: pci: intel: ivsc: use new v4l2-async API for
 mei_csi subdev
Thread-Index: AQHZxdZrJV97y8lyx0m8get72Zm2dK/YQsCAgAABvAA=
Date:   Thu, 3 Aug 2023 08:55:49 +0000
Message-ID: <DM6PR11MB43161D51238D7F211AC034658D08A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1691045257-22642-1-git-send-email-wentong.wu@intel.com>
 <ZMtpw7CtwChmjawz@kekkonen.localdomain>
In-Reply-To: <ZMtpw7CtwChmjawz@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS7PR11MB7689:EE_
x-ms-office365-filtering-correlation-id: 6d8e5885-12e6-4c12-870d-08db93ff6f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: psMbwReMWdBzbRC7Ls9U8ZUNmMXAaYYdHTlBplaB2kBjOBjhrc6YoYmPna2jNB7oFRhz6MCxgO5UuFZlyLyGuDy2yrG4ouLrNONwXg6ycEvKdWSX+BCQOI0ddzVNmfaA1R8j8p7/sK8sMHWMH9o4YOxMxEVPxm/C36+SKhdtHIZkIi6V5E0VGKizW0dajobYwVZqpYwgtoRRvb/M2VZFsLoNIrGtGjXin0zWC7GhraNT7P5wQ3zDFvhbs29zMKQXfs0MijDu0OcAuKfW2U3UWU29uHkKtbFbG0H/xwl1/IywaAXm6x+cchyeia6PDACXbdFq1UGA649LR+Gb5R7pNCvUu7hCZSd/pm1WEfWsZPJnlgIcCGEMZg6Yk1Us9nrE7g1MCzusEOGj8d+odq+npqJKI13UxhCr/kNhp2N/tKnhdPu2aAqffuyjH216+03LRDLM+YVkDTaxEbiEhhGAJGH4HlpOU5Q3fzsb6Acc6FVt1jTyJ4j2SF0sJwP3pqgkcI17kagE9Lm4Iw1NNwIi2dmsa3gU5SxKQHixaJa8tMNMJGNV4vH1D7thRhiEBCxgtWg+it9/HnzEDD/H7kmJA2POX/9fo3Gz0JkoitaYedkA2Wi9oobwDpZZUSstVVLn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(6506007)(83380400001)(186003)(4744005)(316002)(76116006)(2906002)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(7696005)(71200400001)(52536014)(9686003)(54906003)(478600001)(55016003)(38100700002)(122000001)(82960400001)(86362001)(33656002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?58pZ7C2BN2GwPyZaa18Jpg0VrcKPbX890nBTuC3Ak+fIDkdsXtTEw4LZ0Ze8?=
 =?us-ascii?Q?iWzCQT5KpX0Z0r3g7rGSY7xwzwB2fK9ZG9vsEddn6BsrhgjIVI7MQSTj+e18?=
 =?us-ascii?Q?lIQKptCkpLegV2XKDNJeiZ6dnyZXh5HYQZub656Rb/TbCiD+YA3IIwKeWmo3?=
 =?us-ascii?Q?31I3O6jVDr0lEWZVm9z1tiIm/cCX91TfD5uG2zQeKTOZuVqQlzPgGoxvGyBr?=
 =?us-ascii?Q?YPZKy7ixyO/+P6GCJUlMptmDBq3pakh9h93++vXHgxENgXfoKT8Wpok5y2UM?=
 =?us-ascii?Q?OSSab10HJ0pyogkUib1wjjZQx8yr0fGggPshC6S29xz4en41jG0KQKXiqwG4?=
 =?us-ascii?Q?It8xtjEu/4CyVmO15jsZ+wpI+jyRtbV4LcPc5JycczFkbt3UOfUxlflmzLip?=
 =?us-ascii?Q?vriadKGxQgHkoUvhoFAGaMS/bCyfAsyRGG2Re7ojOMSvV04F7cSJIWt2v6lz?=
 =?us-ascii?Q?LhoEMcIEKXOnQUZ/j7J8ilWwCgrbdJSTjEUuGKo70uc6kiOvX/lla4kGC4AZ?=
 =?us-ascii?Q?s3RR1dkqY4R8ZCLddu/E2d4kUFrer+z0E/J9gtlWLOTmo2Ob50LFxc44//dA?=
 =?us-ascii?Q?M2bak3v7GHB1k/apPJEoygX1+5EuwPTKb4c0HJ1Z4V0Zk4jsMG98AXKn6Ul1?=
 =?us-ascii?Q?JGBpwajlHy2iRUW2ODbc2lEWOsiTwQWSe+mWqtFHNTFPD4xEEOOLpzLBied+?=
 =?us-ascii?Q?e9Y47hm9osYqcU0pNbtY4cgGrJVb0SapaebsB2ZXT6vLhbNPYCqXo7/x12C/?=
 =?us-ascii?Q?QY+IJWNRzvserGlYTnjtNp/sK/HthRpgXA+wdCRM7Oc7BmF33PtqgkQtyddz?=
 =?us-ascii?Q?lbtmwbuh23Y6wB5zYZ43QF54AsvxmxvPcSFSY3HmPWzlcgB//QlsiQOn7fLO?=
 =?us-ascii?Q?O5OAH+E1nmV7+Co2lMpqYe+8rv+dvwMKFgVPo/hJ1bwQmFVN6//U7GaMvlbB?=
 =?us-ascii?Q?4q2SPpOfXrRmvgtshWI/BZ/ZPQgf5OEQ4zsr6P9Fu7NLuVgQKsnFYOpJprKi?=
 =?us-ascii?Q?Athnh4UITPGAuMXMjT80WeSbOPBXnsQIOdImswMv47dCzOAMFL/v+3szcAzQ?=
 =?us-ascii?Q?74JlSaYUylMOF/RlkL/aAguESTgb9kduRnlN1FbQPz40VhgnHlOPpCaAgryd?=
 =?us-ascii?Q?a3VlhcU6FROn132VwmNN4UX1qoNZ8mZQXooaAaQKaDyAztSRtrULufBjSCCm?=
 =?us-ascii?Q?1jLDuLnnBd3+2JmiV/iELuOReXtQWObcd/g3iWbcRw+pf9w5RQeTOVUoAMkz?=
 =?us-ascii?Q?7z/OHbF6/0oK0C3bHksCjrJg9oa8jtIQHSovXS43pAOYamK2xB7LYEqk3glq?=
 =?us-ascii?Q?lhtc19kjgS14OYilW2u6+Qrd71I1c0hSu2ODWjmbKjl0CcSeqv4YMVoUdQOE?=
 =?us-ascii?Q?p4j/ME6yEzKvAwa85UT1MeiK4STZi0Sjle4Fc1fN51z7ij5STrzXmEDgZcgO?=
 =?us-ascii?Q?14CB6aSZcRjbiWfLLh0MAL0PA/B0iAwt8q8QUxTy8pYObkDI6HvEkKfRoae7?=
 =?us-ascii?Q?IJVrJyXJdfJlE5wlDx4MJa5h3v6LPKVMVRlfVd1HzwLElJ+kmNT+4ARVTQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8e5885-12e6-4c12-870d-08db93ff6f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 08:55:49.7059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNh/gRgRwotAh2nJ2tKBgKL85wH50ffbe/nj3dRaVSlh2BgGx9CSQ0fgrsPr+6Ay3gdBLlG5klfeiXxRcl99rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks

Yes, it's already there after update your tree.

Thanks
Wentong

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Thursday, August 3, 2023 4:48 PM
>=20
> Hi Wentong,
>=20
> On Thu, Aug 03, 2023 at 02:47:37PM +0800, Wentong Wu wrote:
> > Follow new v4l2-async API for mei_csi subdev.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
>=20
> This won't apply, I believe (most of?) the changes are already in the pat=
ch in my
> tree. Did you forget to update it?
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
