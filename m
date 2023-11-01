Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076277DDD4E
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 08:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjKAHig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 03:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjKAHif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 03:38:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D213F10D
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698824309; x=1730360309;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G93FnfWenXAtRne066EaPaBYP+RWwKXRgcqI/rillAo=;
  b=aK02++TNfrYlPJk55RkjROwVGjsIU7jDhSAE2e3TB8MH5YqPtLrIPqxL
   nvT8TELO6u0ZEtAFs3Nx3AMf/fBllK0QRC/SBL5ydub4QQBuwfQ7UwDBn
   ahNRpnaCf2PRbrsGKIjYwok+4rQmEL51oZca9hd+Vo1KsSuK6SJr/c6cR
   M7b3rUSlTEdngcMMTd4jAHSQ9alTRdXyPamPH+Vt+XA9s3euVRtKYiBLv
   V3XnKjCAIENH0ELo1wM8/VsnsbZ+ypVl7nW/tn9YeK9doTaLI95GRk4we
   c23EShjkWktAPtmiHcf4IElGu/mOH2gSjtLuEG9SszjNdqADe0PzXm53W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474691426"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="474691426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764494823"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="764494823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Nov 2023 00:38:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 00:38:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 00:38:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 00:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYqQOmx0fm7NR+8AJVBMXU/dBEoxqaZPGrkYsljUn075qT3tJmqRSgBN4mfN7iNHqvbtW7zp2I8f6beZs6NTkwEII6HL0gWMUgiG8Dw3rrMVT5Oi42F6AEdagO8lRLcF/e2LEl6nkywZJdpD3/BnOoArf3CNA5TdDJbXLRnfBACslqMZxseeMjkBJ6UasGKUXMorEk7gUmaMAG1jnrVIo+ltqYEhgmPnnEnGV+V2232/ELUXVsO+e/0Pnf67fhX+0vDuFEyC6APqChUf+boS4SknhVcKKYfzK4S3YPScIdaJZojOG1tUVdb1o1lnbUGXovwdoQo5zMKVtWjZnS8mNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y25HzvBBxLY/DEqrQkCvWFanb1J7T0+EB2JBOQxZ9Nc=;
 b=S8MlzPUIRM7eiKKAXtpBu2ttHcQw3TLEMk4HDbIvB/XTC4VwBFesu4lxAKZd0V9aauUimQFVAAg5YZ85l9BMzTCqrkbK6MGdd47NxxSIYBy3nb3PndyWp6k2AE67ztZu7YxVe9Zon/yPMfxRHMJx2Ihv9Ig2Gt2QlDpBGYh+fCFfLWxB29Ni4KWd2NubIkpwH7GF8YGOPNC1sKEgECb3tISX/3eNbVrDfc6LXOzv8P7oeKZBuD4Mxciy2MBMsVJX+eVuNnYlVbhRbKpUT3AsPMHExkTeuTm5Z+BJmdFVlJWOCRCNPGXcsTVoB/XbqZR129NO/Gsi8UrS3xVtJhRlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB7811.namprd11.prod.outlook.com (2603:10b6:208:3f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Wed, 1 Nov
 2023 07:38:25 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9818:3765:1b10:1c5a]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9818:3765:1b10:1c5a%7]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 07:38:25 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Thread-Topic: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Thread-Index: AQHZqSDTvmce4y3l2U2ALjubC9kVbrBixHeAgAAG7ICAAADDgIAABzUAgALxaZCAAA5qgIAABzvg
Date:   Wed, 1 Nov 2023 07:38:24 +0000
Message-ID: <DM8PR11MB56533C342B834265A3F64D1499A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
 <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
In-Reply-To: <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|IA1PR11MB7811:EE_
x-ms-office365-filtering-correlation-id: dbc2f26d-6a35-426f-81cc-08dbdaad87f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yzcCrtIjPtRFWOptXajl/Pm/voI9qMaKH0ztnic6yIGNJhAYYEDqf2LXdwBlrR3+7s1T2PDXJctcsFMkKOGhuiLvCBXDX2yP5GKCBkBp3V2V8c2JT2bza7eUdCIVchj3JrGD8ZNuz6921eaZWFithxnu93awFIzrenmMHys5C1q/eBGs5vq0uqYJEtXhw7ViBX5tLwxyNrTLfydWNveDmMFuX+ISTS6f2nmf5DmzdMb4OrmVLOakr+ukFBPsH/ETdJbsxeCcabWQHbecEalGGVE8OXA4oj4+jyXqzYLqmYvryI8Q8p+o/kNiJSW7N5oYZ5MHS/uA5B8v5nrXoj7sVGNJ4CW1NI6yeBd5Zkkup/QwzQ4agyP5sAG2sOQiRVJHq3uSgT6cGsjTQe/fGe1o7fBeoRtE7WiEEtwLWzplKLbST6WhIxhht5XV49deyGHgxHUCmtJqHqbvdvfl/H3Zcr+mzW2X3CmVAELCgv917p17tg4I1h6yD0fRQXGcwRERiTqmUaD+ae5GTFYPCSsyjGrhSgYDholmYgBFdKIXd0gMp6iH2FY/XJfxQ7hWqGmfOnAZj8HnMqxHxb6hd7VzBbKQbaYQZNhsMtT5P7Q+l1/CD9mwSwWWCelVPf6AVIq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(64756008)(53546011)(83380400001)(7696005)(6506007)(71200400001)(478600001)(9686003)(26005)(66446008)(41300700001)(66946007)(5660300002)(66476007)(2906002)(54906003)(8936002)(76116006)(38070700009)(8676002)(4326008)(316002)(52536014)(86362001)(33656002)(122000001)(82960400001)(38100700002)(66556008)(6916009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R3gwHqTJD7o5XuUi8jpMa0ydU7Uy0P2oreZECW7zQ14D3ml7bnk88xFADWsg?=
 =?us-ascii?Q?mbTS/smY3oYNICI9VKAjVYS0Oy3zEBWFbJcC8AW3su0JYvxdhYuRR7J8dZPY?=
 =?us-ascii?Q?aiNdJvWEtNduydfZpDw0pJ6ckZuCq82mmj9lMRL3gXyFrQK6SXz5TENv6usz?=
 =?us-ascii?Q?raj6RQA/9J9CL4OtEm/AoRSiAGS1w49jz82YEDWYF+E9Y+IRSWc+sXxZvrqU?=
 =?us-ascii?Q?9aFKcbftBEYah2HnIPJfoz1TBhswd0UNOQm7eJyOJEcLrPy7FUNOJabopBIE?=
 =?us-ascii?Q?DlIVoDQbcz/V/pIVJltiPnBbkS57IdOS2IpaZedusVEnI1GU8+XErpTfjNBm?=
 =?us-ascii?Q?JskVntG2u4C2nJh0WeaimYix0YrJfqlpin1DFLyFV6udMAg61hM9QIjcUncZ?=
 =?us-ascii?Q?NCp1bNVG1xOsysR+3UgVKbsfTvk0hPTf7cMpJiUGU7jdwXtESsu/lLyReYHj?=
 =?us-ascii?Q?s5NFR5bUp+wAsqRiH/o7TGZTrE+ds7Gwnub8DSeAGUUWHKWKLg7R8C/ZHedY?=
 =?us-ascii?Q?4+CtMUHHP20tOqt50rh9eyR4+/Zj9RWJRJ4VULHnCmgmO7YYBl03XKSlFbIq?=
 =?us-ascii?Q?/EQlH2st17iWSJ2TpYfayp1Z2v9Z9cuXxTwo4WPO4JSm8qqhAPtjg5Wy4hfW?=
 =?us-ascii?Q?W90dzVOeRXp+hZ4lqo9iPO5KFeWOXIGPH4elRBRwRZuf0HzFo+a67oIqJATv?=
 =?us-ascii?Q?skd8TGToBDljBJoHZ8x5vO/Yg0Tx6aZ/5ss9wzzi2knTkcAukZBa1xAlBEyw?=
 =?us-ascii?Q?AUFqjbu9zRYhE6iiEoXvcHdK+u+u1M8Uga1xR7m5GXE5dBiCJeieZ3584c3V?=
 =?us-ascii?Q?BBozHHPmsqHZP+kE4khqXgBKr78ueVg0qgykrGFsT10Jo3QMpr+qDb72LC+T?=
 =?us-ascii?Q?7S7trGTtic9Ng9dGEAcSGX9DryVmlpbMWnJdjycw2NrrgkBJQVp/h2lDSDB1?=
 =?us-ascii?Q?2WlID46MvzmAg09N3/jLuDI234WDK2OoN+6/ByIUlCRYmVMK7+7hQhgqJnuM?=
 =?us-ascii?Q?04IYxa9DAcEthrrb4NjIu9u/0iDWl1Jmi3+rgqv3iAkHFFl1DiieKR1qk10U?=
 =?us-ascii?Q?U1O9vQ5UZwLFKHN73zrMRH6NcKJW97VT8GiYM8GHWUAYz3kwPDN1JoA0UTPZ?=
 =?us-ascii?Q?I036RX5Qx0xOB9NFnoVNLZHRvrDw27d6e21DS5G+f65J/xF75sQOXpNkMmKA?=
 =?us-ascii?Q?hjGGcnWNoUAMt1wbMuDmxgRwJ4FiQ7dhQWT2UZJ6/hbhiT9VZAZBzUW0t/iE?=
 =?us-ascii?Q?BLbY4womAvN2wT3d6hSwR9qjxuUNagn9DxaPsAAJ8t87ONfQSpDx6aKYOcWI?=
 =?us-ascii?Q?sccpdBrAz29ht+E0ntMbdGM6x0a5hMCT49WF+SKQb9oXGK8LFedTHM89QkIz?=
 =?us-ascii?Q?8lDDJvWoYvYyVcdjczNmryOnfhRDcCUHXABKMkkl+ajOkeqzfdN3j2ACRNmX?=
 =?us-ascii?Q?GNEeKKDtB7aBjTLWOkMCLUCllFUdqBCXfBg3RBR2wm2RVAdtmGdd8O8WwsfX?=
 =?us-ascii?Q?Dahlw2v7ZcYQR9nkPzzP29GUcN/L80p/bKXmH5SKr/3sRXP8fE0EtpFl9QDr?=
 =?us-ascii?Q?Al/mmpmRs2WNrm0IqoKdWErVcC8duge+adsSRQ9Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc2f26d-6a35-426f-81cc-08dbdaad87f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 07:38:24.7857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYaZn3lb09oy4dV6buZheAeAIGHqmMqfR+peg9jeltFVIkgnbiFOEYZ3bVP9TtM+rhrEAbKwA0yklSrm+EAlNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7811
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Wednesday, November 1, 2023 3:12 PM
>To: Cao, Bingbu <bingbu.cao@intel.com>
>Cc: Hans de Goede <hdegoede@redhat.com>; Bingbu Cao
><bingbu.cao@linux.intel.com>; Laurent Pinchart
><laurent.pinchart@ideasonboard.com>; Daniel Scally
><dan.scally@ideasonboard.com>; Mauro Carvalho Chehab <mchehab@kernel.org>;
>Andy Shevchenko <andy@kernel.org>; Kate Hsuan <hpa@redhat.com>; linux-
>media@vger.kernel.org
>Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
>device-link between VCM and sensor
>
>Hi Bingbu,
>
>On Wed, Nov 01, 2023 at 06:26:39AM +0000, Cao, Bingbu wrote:
>> Sakari and Hans,
>>
>> ----------------------------------------------------------------------
>> --
>> BRs,
>> Bingbu Cao
>>
>> >-----Original Message-----
>> >From: Sakari Ailus <sakari.ailus@linux.intel.com>
>> >Sent: Monday, October 30, 2023 5:24 PM
>> >To: Hans de Goede <hdegoede@redhat.com>
>> >Cc: Bingbu Cao <bingbu.cao@linux.intel.com>; Laurent Pinchart
>> ><laurent.pinchart@ideasonboard.com>; Daniel Scally
>> ><dan.scally@ideasonboard.com>; Mauro Carvalho Chehab
>> ><mchehab@kernel.org>; Andy Shevchenko <andy@kernel.org>; Kate Hsuan
>> ><hpa@redhat.com>; Cao, Bingbu <bingbu.cao@intel.com>;
>> >linux-media@vger.kernel.org
>> >Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
>> >device-link between VCM and sensor
>> >
>> >Hi Hans,
>> >
>> >On Mon, Oct 30, 2023 at 09:58:09AM +0100, Hans de Goede wrote:
>> >> Hi,
>> >>
>> >> On 10/30/23 09:55, Sakari Ailus wrote:
>> >> > Hi Bingbu,
>> >> >
>> >> > On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
>> >> >>> +static void intel_cio2_bridge_instantiate_vcm_work(struct
>> >> >>> +work_struct *_work) {
>> >> >>> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =3D
>> >> >>> +		container_of(_work,
>> >> >>> +			     struct
>> >intel_cio2_bridge_instantiate_vcm_work_data,
>> >> >>> +			     work);
>> >> >>> +	struct acpi_device *adev =3D ACPI_COMPANION(work->sensor);
>> >> >>> +	struct i2c_client *vcm_client;
>> >> >>> +	bool put_fwnode =3D true;
>> >> >>> +	int ret;
>> >> >>>
>> >> >>> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor-
>>adev));
>> >> >>> -	board_info.dev_name =3D name;
>> >> >>> -	strscpy(board_info.type, sensor->vcm_type,
>> >ARRAY_SIZE(board_info.type));
>> >> >>> -	board_info.swnode =3D &sensor->swnodes[SWNODE_VCM];
>> >> >>> -
>> >> >>> -	sensor->vcm_i2c_client =3D
>> >> >>> -
>	i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor-
>> >>adev),
>> >> >>> -					      1, &board_info);
>> >> >>> -	if (IS_ERR(sensor->vcm_i2c_client)) {
>> >> >>> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM
>i2c-
>> >client: %ld\n",
>> >> >>> -			 PTR_ERR(sensor->vcm_i2c_client));
>> >> >>> -		sensor->vcm_i2c_client =3D NULL;
>> >> >>> +	/*
>> >> >>> +	 * The client may get probed before the device_link gets
>added below
>> >> >>> +	 * make sure the sensor is powered-up during probe.
>> >> >>> +	 */
>> >> >>> +	ret =3D pm_runtime_get_sync(work->sensor);
>> >> >>> +	if (ret < 0) {
>> >> >>> +		dev_err(work->sensor, "Error %d runtime-resuming
>sensor,
>> >cannot instantiate VCM\n",
>> >> >>> +			ret);
>> >> >>> +		goto out;
>> >> >>>  	}
>> >> >>
>> >> >> One question here: how do we make sure that the runtime PM of
>> >> >> the sensor is enabled during the .bound callback? Or is it a
>> >> >> mandatory requirement of driver of such camera sensors?
>> >> >
>> >> > The sensor driver needs to enable runtime PM in probe, otherwise
>> >> > this won't work. But I don't see why a driver wouldn't? Of course
>> >> > otherwise it wouldn't be a hard requirement.
>> >
>> >I meant to write "wasn't earlier a hard requirement". This could also
>> >be documented, I can write a patch for this.
>>
>> The problem here is that some driver doesn't enable the runtime PM
>> before v4l2_async_register_subdev_sensor(), that may cause race
>> condition and VCM instantiation failure as the runtime PM is not
>> enabled yet. Then there is no chance for VCM instantiation to succeed.
>
>These drivers need to be fixed.
>
>All initialisation needs to complete by the time the async sub-device is
>registered as this is when the sensor may be bound to a notifier and also
>accessible via the UAPI.

Ack. Thanks!

>
>In most of the cases the rest of the probe completes even if runtime PM is
>enabled after registering the sub-device (without IPU bridge) but it's
>still not correct.
>
>>
>> Does this 'requirement' or limit really make sense?
>
>--
>Regards,
>
>Sakari Ailus
