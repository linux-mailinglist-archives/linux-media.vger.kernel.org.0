Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6430712562
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 13:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243136AbjEZLV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 07:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242596AbjEZLV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 07:21:26 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F98198
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685100085; x=1716636085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e55S0E7pr2ku40IbcW9TDFCtgBvcI9fGV6LYr6UcLEE=;
  b=BIOBA3NEZHCIgBW8DUFcYt/kPgc8XXlOjguRIkQhIsEtF1olyEmw68kN
   w17PbAZGocGIJg3jB1mUPfXF8jS0Op96FINbJc6lGVsY2Thvs02TCC8ho
   QWKS4p6k6qQIWJfViZU227DfPknBcsUGuxf8WbSWmhg7GcDDNDJrjqHC9
   BGxdpmZuOGtOYYk6ijAjT/FlsrGSV292+Fh228MJdsJvId5mXM2cjOQGK
   GKp7kyc4zHeaxaVQiBxo9HY46WtdIqMQnHI9hSMPTqn8CrQN0R3XireYO
   IEvP0bD/u7t0NEhxZBh9b9gR7Kkldz8U8zdPd6UbMk+pdCTQfD1/J9vYc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382424861"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382424861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817502695"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="817502695"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 04:21:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 04:21:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 04:21:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 04:21:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 04:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk6BrbOKwH4674oleNQoMf1UDsReN19XC4MOL7ru1BKRgF+fkKmeJ4CJh3q+8JLjQ4AlbBT9PJOorM9DWylruSO+zo14iwjGmeTBUTPrqE7px8VXw+w1lldO5/8mp2BNLQ4PumZj2fsowNqnGSJ9HXOh2WjX7OynWpBZWUV4eJ7VUrY7z4xuNgG4k2b+3zuI44OlX2xuYcpTMry2zvHvKVT8ItXZSjy5vKF5snfcsG9ltA4K01uEAWyNTr5UUsVLu3q4MvWhNuCimAWP/HkeqMNRfT2jl9HkmY4hSv+F/iqOmaigDdm2NnLFFxPat5xFNcT2ZSG1BUtqAs+einC4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeIBpNoLuSgemh48SXX3bozpppa9i38mPHFbxC/bhls=;
 b=noghEVz3tbHFrWjhqpWEVCkwxC2UcIfywtobpOHfwRW224BWIsOwG5TKoy6dnO4Jpn1Tk1JE2wnKR+qCMYGxIFOsYFh0kXCqflmDtb6IkCcXJhqk0QRHi82zV4FpkcNZFyacNe5RWJ0YfiHibsSgwQS3ZTaSQhrfQBp1wb7hAD1TxrTZGq1gBibhdTWfucVW6IpfGSXfsGAO4OpsBArMIKQ3XblXkUqcOQt1KPqX2qCFJDIq/63KueuPoDG/wBje1rwAF46ph9P2Ltc3fMEotmIZv1ixnQ8i4zAqDB34UV61PVjUY8vqBkJDVDfmS2+/ZKYB85VX6fS57ny0+v0cLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17; Fri, 26 May 2023 11:21:20 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c%5]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 11:21:20 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Kao, Arec" <arec.kao@intel.com>, "Yao, Hao" <hao.yao@intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 3/4] media: ov13b10: add PM control support based on power
 resources
Thread-Topic: [PATCH 3/4] media: ov13b10: add PM control support based on
 power resources
Thread-Index: AQHZj7cirqaO8F41fk22BsnrtsEokK9sUqwAgAAT2bA=
Date:   Fri, 26 May 2023 11:21:20 +0000
Message-ID: <DM8PR11MB56537D167FDF388A942802A299479@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230526095839.2443058-1-bingbu.cao@intel.com>
 <20230526095839.2443058-3-bingbu.cao@intel.com>
 <ZHCDfuO4Dsha5kzI@kekkonen.localdomain>
In-Reply-To: <ZHCDfuO4Dsha5kzI@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|DM4PR11MB6477:EE_
x-ms-office365-filtering-correlation-id: f181f5c8-a16c-41d8-c264-08db5ddb54cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FTtWhXJ659PfnYeaN/fse8IJfcEn/cSXHXsmYFWoiLwB6SVZ4RZycbrkHyw+5INJuwECHd6O9WfBP5C8zxawBWqdLyjpQwiQLkAExJ/REOO4baN64CeFyo9zHUMA/p6gLQcncvlkK5IZKWjKttXph3IdQ8SlfxTvwO7M2IxBjp7ev2Q0IU1J5+xgRZmblzaaFEtRjL5xvN262XxLFe5ObPaeE+JR78hUBc6HHdcTVu45zU52ZX3XvWUgy3eJeTUAUniIZodWbmgu2y96TOah7KtxBZpqWWwCj6oj1ztGxcGToucO3hPLWbjcaQuTgXORGnf2EqoArhv1peUFtiAftLxNysY2CEpiSwZ/uz81QLM7q922kZY3LajnIcIDN0Jr6rBr5R5vpbVzQFht+78aj6CJBHudw72kqUiOesY/fH/HsrI+9LF/DAatu4KF/RQC9n/wfCtq9VOKs6cx6/CzgAVt0S6bA7BJq/E58wXIV3DKSNTU25X/cGVV9/thcRq+EtZ6QvWNnrAshHUqyRNY06CIj9znK1nFoMzyES1uJUNw+9pz7Ps3ETUO1SQx2G1blelcggapzuAGmjViTwNxREAveOEmtGf029ZkOvw7Mjm5K76Hi/FbDEg6gE02Ww2m
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(66476007)(66556008)(64756008)(66446008)(83380400001)(478600001)(66946007)(76116006)(6506007)(9686003)(26005)(6916009)(38070700005)(54906003)(4326008)(71200400001)(316002)(41300700001)(7696005)(2906002)(33656002)(186003)(122000001)(38100700002)(86362001)(82960400001)(52536014)(8676002)(5660300002)(8936002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o1rjFFpt9Fu2jm0wIe2xLI5+M2ozp7jNq8HrzZz4bov230NpNKSKLbs5nt1P?=
 =?us-ascii?Q?W8HJihuJqOQJ95+Os8AiBxCXebGgnrhJyEaKDn1SMKrDrjoOXlhmGXJX5EdE?=
 =?us-ascii?Q?CmGRrsIV6Vo1e49n3KpHTRsQdHwwSZwqUxFuDQEKUwmhJVYnhyyD43Wwo4l7?=
 =?us-ascii?Q?8ktQ31/w3YKLszsE5Jh9cmksOXb7R8GEYw5qLhXx2GrAhvrMfL/FGGmCcJNu?=
 =?us-ascii?Q?T2WbQjqzU680/L6GiGMZYStdkpFsTjkARBfPeK7srrast2NN0YUY6shyH8K6?=
 =?us-ascii?Q?i9ED+8M8LKU0q/C0kBFaeSG1upA4YSEqARWMqI4TUQi2FhKzQtBxBEJJG9je?=
 =?us-ascii?Q?HGHrw73P25lYlLz+03lGZ0KCVTaM4SKflSRQCY/jWHYaxzD/4dAU2aFTu9/I?=
 =?us-ascii?Q?1/TGjPSW+9bHS8NhaEu5so/PADUlSVtU/6sd4RcyWJA6PHy9oSiNCu6gJ/53?=
 =?us-ascii?Q?k8OzGCwmS0F9nFswBPF3hMU6jZuuvQAJhtb/VgqM/yKNst1qnE/Pvm/bSL7c?=
 =?us-ascii?Q?9Ad7n9jXZ83w0C9vuiA8o7FgfomsMQwQGkcr7qUtwnzzZdezOt4boePObVFN?=
 =?us-ascii?Q?fuyZrMJK00rk7LpR5FANkXZ/nLprSjCfoTAr7k+rAQrjVTjsw8HVwCq6S8Cf?=
 =?us-ascii?Q?OnVoggyeD9yd+P24T3lF5NU9uq4JRriXMSKyEIyTbYGL5yO5nz0sSetHO/At?=
 =?us-ascii?Q?ko7yz+Tzrcji9n7Hb0HopAQ01fP0x6MlPsg90DT6oztpDIHC7rfsnZwUC0xP?=
 =?us-ascii?Q?wqHAVkEGdKfukA3zXOpuLqFZs0uKSAQT0Qe3RYk+YEkl+zaRA8uNpWyGaIcr?=
 =?us-ascii?Q?IBGxVqYeJizxnRNPVMQRdwyoOt1006iN7UGmcnsS4IuCj4lQS7HB8Y17ZAsF?=
 =?us-ascii?Q?9BbEx4vLT+rmCOhfyG55KvC9/b7NOWJnvs/uZgHMuH/pIeBhUnVLxryAmN3x?=
 =?us-ascii?Q?eXmsIS0HOBXyPY3N9rjIHQsrGaB2BfHMMUeRIiOYjAvJSPhTIbNRuA4aTlPC?=
 =?us-ascii?Q?v0HiWD5icgwpsIX4CsizsC9ojUqZY5+QXUCV9Xil0ctY25AyHcCu58W91CSG?=
 =?us-ascii?Q?UFaUi0af8b6f6nBl8vl6uxebQ+k8mGXEjbZTLv9RMJB14tSNeqaWWxLTUnNo?=
 =?us-ascii?Q?/7rL9AYQqUpZ9cOJK8uc98VcajcMMD2G2yfYFqZ2N5quzp95CwkK2d5L3ZDi?=
 =?us-ascii?Q?/z+23RbPGhqvHtLaZiH8j6uyDo+PVVF5FXLk55Of8dAhJeYPz9wjHMmQoELV?=
 =?us-ascii?Q?oBRs7VLGgA2IKxbw/2YuKxFKKzs87JktX5OkqgxrgFp1JsVlLyqkKgqu2Lb4?=
 =?us-ascii?Q?K2FUOvWPLtFecQQ/+cIniU2q7DPRA3yCOeplEsjtqpKg9lkr78+XhlvZ7Xh0?=
 =?us-ascii?Q?e+Yj3nDUMbdhF4tYjEzZBsGUbypVuhooSD0vbRTSikyBGj5zbzjLW9xouZ71?=
 =?us-ascii?Q?iUzLxlkk8ja1y1tGMsEAdHhAurBAPLGeN7o6QgSVR1VsHxPg2PyDlb9V3ixj?=
 =?us-ascii?Q?uLk6Z3u21gMPYONzZ/LLTG3LQLlrcTOTH7eeJ6u8RnJhXjWAr3CmzL18DOl8?=
 =?us-ascii?Q?9Nv8jFvC4OtG5WlEmHZPL6IN6YNprXf6WJNvna9z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f181f5c8-a16c-41d8-c264-08db5ddb54cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 11:21:20.4741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77dSTugbDTrYNg5zcCyAuR2S4twegN6miM6rM0wNgq7y0ZBVa2SleHu1dFo2N9DhxLk/9Dfj6ksz2RLrQY5fFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,=20

Thanks for your review.

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Friday, May 26, 2023 18:02
>To: Cao, Bingbu <bingbu.cao@intel.com>
>Cc: linux-media@vger.kernel.org; Kao, Arec <arec.kao@intel.com>; Yao, Hao
><hao.yao@intel.com>; bingbu.cao@linux.intel.com
>Subject: Re: [PATCH 3/4] media: ov13b10: add PM control support based on
>power resources
>
>Hi Bingbu,
>
>Thanks for the patch.
>
>On Fri, May 26, 2023 at 05:58:39PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> On ACPI based platforms, the ov13b10 camera sensor need to be powered
>> up by acquire the PM resource from INT3472. On such platform, 1 GPIO
>> can be used to enable AVDD and DOVDD, 1 GPIO to reset, we just have
>> one power supply 'vdd' for camera. Add 2 power interfaces and also
>> registered as runtime PM callbacks to support that.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> ---
>>  drivers/media/i2c/ov13b10.c | 98
>> ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 96 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
>> index 2d48c94659a4..b1faa89a3571 100644
>> --- a/drivers/media/i2c/ov13b10.c
>> +++ b/drivers/media/i2c/ov13b10.c
>> @@ -2,6 +2,9 @@
>>  // Copyright (c) 2021 Intel Corporation.
>>
>>  #include <linux/acpi.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>>  #include <linux/i2c.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>> @@ -573,6 +576,11 @@ struct ov13b10 {
>>  	struct media_pad pad;
>>
>>  	struct v4l2_ctrl_handler ctrl_handler;
>> +
>> +	struct clk *img_clk;
>> +	struct regulator *vdd;
>> +	struct gpio_desc *reset;
>> +
>>  	/* V4L2 Controls */
>>  	struct v4l2_ctrl *link_freq;
>>  	struct v4l2_ctrl *pixel_rate;
>> @@ -1051,6 +1059,50 @@ static int ov13b10_identify_module(struct ov13b10
>*ov13b)
>>  	return 0;
>>  }
>>
>> +static int ov13b10_power_off(struct device *dev) {
>> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b10 =3D to_ov13b10(sd);
>> +
>> +	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
>> +		return 0;
>
>This can be dropped.
>
>> +
>> +	gpiod_set_value_cansleep(ov13b10->reset, 1);
>> +	regulator_disable(ov13b10->vdd);
>> +	clk_disable_unprepare(ov13b10->img_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov13b10_power_on(struct device *dev) {
>> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b10 =3D to_ov13b10(sd);
>> +	int ret;
>> +
>> +	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
>> +		return 0;
>
>Instead I'd execute the sleep below if any of these is non-NULL. No need t=
o
>return here.
>
>> +
>> +	ret =3D clk_prepare_enable(ov13b10->img_clk);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D regulator_enable(ov13b10->vdd);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable vdd: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	gpiod_set_value_cansleep(ov13b10->reset, 0);
>> +
>> +	/* 5ms to wait ready after XSHUTDN assert */
>> +	usleep_range(5000, 5500);
>> +
>> +	return 0;
>> +}
>> +
>>  static int ov13b10_start_streaming(struct ov13b10 *ov13b)  {
>>  	struct i2c_client *client =3D v4l2_get_subdevdata(&ov13b->sd); @@
>> -1317,6 +1369,37 @@ static void ov13b10_free_controls(struct ov13b10
>*ov13b)
>>  	mutex_destroy(&ov13b->mutex);
>>  }
>>
>> +static void ov13b10_get_pm_resources(struct device *dev) {
>> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b =3D to_ov13b10(sd);
>> +
>> +	if (!is_acpi_node(dev_fwnode(dev)))
>> +		return;
>
>I'd omit this check. This would work on DT although bindings should still
>be written. That may be left for a future excercise I think.
>
>> +
>> +	ov13b->reset =3D devm_gpiod_get_optional(dev, "reset",
>> +					       GPIOD_OUT_LOW);
>> +	if (IS_ERR(ov13b->reset)) {
>> +		dev_dbg(dev, "failed to get reset gpio: %ld",
>> +			PTR_ERR(ov13b->reset));
>> +		ov13b->reset =3D NULL;
>> +	}
>> +
>> +	ov13b->img_clk =3D devm_clk_get_optional(dev, NULL);
>> +	if (IS_ERR(ov13b->img_clk)) {
>> +		dev_dbg(dev, "failed to get imaging clock: %ld",
>> +			PTR_ERR(ov13b->img_clk));
>> +		ov13b->img_clk =3D NULL;
>> +	}
>> +
>> +	ov13b->vdd =3D devm_regulator_get_optional(dev, "vdd");
>> +	if (IS_ERR(ov13b->vdd)) {
>> +		dev_dbg(dev, "failed to get vdd regulator: %ld",
>> +			PTR_ERR(ov13b->vdd));
>> +		ov13b->vdd =3D NULL;
>
>You should return the error code instead, in all three cases.

On some platforms such as Chromebook, there is no INT3472 requirement.
Here it ignores that case and return without errors, thus the power on
and off callback would be NULL functions then.


>
>> +	}
>> +}
>> +
>>  static int ov13b10_check_hwcfg(struct device *dev)  {
>>  	struct v4l2_fwnode_endpoint bus_cfg =3D { @@ -1407,13 +1490,21 @@
>> static int ov13b10_probe(struct i2c_client *client)
>>  	/* Initialize subdev */
>>  	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
>>
>> +	ov13b10_get_pm_resources(&client->dev);
>> +
>>  	full_power =3D acpi_dev_state_d0(&client->dev);
>>  	if (full_power) {
>> +		ov13b10_power_on(&client->dev);
>> +		if (ret) {
>> +			dev_err(&client->dev, "failed to power on\n");
>> +			goto error_power_off;
>
>return ret;

After power on, the caller has no idea which PM resource was
set, so here call power off as a rollback.

>
>See also below...
>
>> +		}
>> +
>>  		/* Check module identity */
>>  		ret =3D ov13b10_identify_module(ov13b);
>>  		if (ret) {
>>  			dev_err(&client->dev, "failed to find sensor: %d\n",
>ret);
>> -			return ret;
>> +			goto error_power_off;
>>  		}
>>  	}
>>
>> @@ -1422,7 +1513,7 @@ static int ov13b10_probe(struct i2c_client
>> *client)
>>
>>  	ret =3D ov13b10_init_controls(ov13b);
>>  	if (ret)
>> -		return ret;
>> +		goto error_power_off;
>>
>>  	/* Initialize subdev */
>>  	ov13b->sd.internal_ops =3D &ov13b10_internal_ops; @@ -1461,6 +1552,8
>> @@ static int ov13b10_probe(struct i2c_client *client)
>>  error_handler_free:
>>  	ov13b10_free_controls(ov13b);
>>  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
>> +error_power_off:
>> +	ov13b10_power_off(&client->dev);
>
>This may only be called if ov13b10_power_on() was successfully called firs=
t.
>
>>
>>  	return ret;
>>  }
>> @@ -1479,6 +1572,7 @@ static void ov13b10_remove(struct i2c_client
>> *client)
>>
>>  static const struct dev_pm_ops ov13b10_pm_ops =3D {
>>  	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
>> +	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)
>>  };
>>
>>  #ifdef CONFIG_ACPI
>>
>
>--
>Kind regards,
>
>Sakari Ailus
