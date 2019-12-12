Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C936C11CCDE
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbfLLMO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:14:59 -0500
Received: from rcdn-iport-8.cisco.com ([173.37.86.79]:50145 "EHLO
        rcdn-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729004AbfLLMO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:14:59 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Dec 2019 07:14:58 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=30; q=dns/txt; s=iport;
  t=1576152898; x=1577362498;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=OYorUhP+JN+YVnXyYmhFBrFFCssuGCggPRB+CKEdaF4=;
  b=ZYvW8sYsxByACF4UfNSEptg0PvUQLnwFQAQXLMyU4dJ+7wwqCWHQQl8L
   7Ae2z7lrIMN43xMbQuN/jp7nwMbRm0LS9OHOuy2Gu3CpLHK6cXQxbWLOt
   U6MV5fzR4Oa8UJZDel4j9gPiJueE4AyAF5BtTthpUgR+oWmzfWl3d0nCg
   k=;
IronPort-PHdr: =?us-ascii?q?9a23=3A2squXhLaO740H6bKHNmcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeBvKd2lFGcW4Ld5roEkOfQv636EU04qZea+DFnEtRXUg?=
 =?us-ascii?q?Mdz8AfngguGsmAXE3yKuX0YjY5NM9DT1RiuXq8NBsdFQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DgEABFLPJd/5ldJa1lhA9QBYFEIAQ?=
 =?us-ascii?q?LKgqDeYNGA4sITpFxiCaBQoEQA0ISCQEBAQwBAS0CAQGEWYFzJDgTAgMNAQE?=
 =?us-ascii?q?EAQEBAgEFBG2FNwELhXcHChEMAQE4EQEiAiYCBDAVEgQNCAEBHoMAgkcDLgG?=
 =?us-ascii?q?iHgKBOIhhdYEygn4BAQWCSoI7GIIXCYEOKIc/hFkagUE/gTiEOIMIARIBgy+?=
 =?us-ascii?q?CXpAujyuPGgqCMAOVcAYbgjIBD4d2kAmOS5o9AgQCBAUCDgEBBYFpImdxcBW?=
 =?us-ascii?q?DJ1ARFJQTilN0gSiMS4EiAYEPAQE?=
X-IronPort-AV: E=Sophos;i="5.69,305,1571702400"; 
   d="scan'208";a="681073487"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 12 Dec 2019 12:07:50 +0000
Received: from XCH-RCD-007.cisco.com (xch-rcd-007.cisco.com [173.37.102.17])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id xBCC7nHi027526
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 12:07:49 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-007.cisco.com
 (173.37.102.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 06:07:49 -0600
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 06:07:48 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 12 Dec 2019 06:07:48 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5luwS0Eu78A3KzfjsYiSOTdSYinghVLV+UfJps64DXjpqmRi4DdCqwj7fwoMECpJCtK2CDoz6JPRvi6qsIm+I3+hCTo584/YpxNxRS04d+0cCALu9XAPMvXJEqR+n0Pnq9ppBRIMos7fn6xTI/vZsm8QXAvv8sMMfWkTDiZLbmLeAzFxjxAzZbmMY6JLfL80+3jaBLcnhpMOy3+t2KRYk770ziUH/Yl4stU6T46rQMmn4h0cJtJrVBSvtCYQHkhfI05IoTllfyJE3hjbzgpQozyl05HTjI1sd6Oo/9fX50nhHjQB+r5ld6NsqllEZdIPdHNYvu2sXUS8tB9kJF1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYorUhP+JN+YVnXyYmhFBrFFCssuGCggPRB+CKEdaF4=;
 b=kQixySjIQmqh3lRTjzXZGhdxmnhTbaJApFvK6AJnkRGplxcwqTk4f4m2qQWl3RIGSG1HiAqtwR8H8YdgNTZoFoN452jpsD6+txJ7broK7y1mcsa77wFHTkxUPZjEHKiUObzfdJVg6PzjCPpNENAztt5rFdMKnQHvZbIzELgLwuFAvrRks/+lk46l7h/GGVHyw/Ve/NSENF2puttts5DZy8Pig9+0nfuSLRP5XQtS9N2T3ucDG6t0EdeIC7QCGe2lzHp8wlZnbrjsTPZud+44A++yKo3ZtlY2uoD4/qOdap60ATPgicNaxFZVOyNhbbZEiPJ+7ybdrka2nN6PWXRfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYorUhP+JN+YVnXyYmhFBrFFCssuGCggPRB+CKEdaF4=;
 b=lZy6zFAF10ikwH3uTCuVR5PiKDH09Fk4LW6eztVWa8PU8EkWnBPy3w9v1QN8Kfbgrzhx9avoyNgmezuVbeshFGQSIt8meWOeYTmlTZuV2LpizM/uQNSm7M70wNUqerfxr7UlqE4uPFHjmp3WBi7f80DaXSwR3JhrXvf+JrVu/Fs=
Received: from CY4PR11MB0054.namprd11.prod.outlook.com (10.171.254.155) by
 CY4PR11MB0006.namprd11.prod.outlook.com (10.171.255.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 12:07:47 +0000
Received: from CY4PR11MB0054.namprd11.prod.outlook.com
 ([fe80::9c06:b401:1d5b:6e32]) by CY4PR11MB0054.namprd11.prod.outlook.com
 ([fe80::9c06:b401:1d5b:6e32%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 12:07:47 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Test email, please ignore
Thread-Topic: Test email, please ignore
Thread-Index: AQHVsOTEv2mjLGWIpECsJe0cTSRlmw==
Date:   Thu, 12 Dec 2019 12:07:47 +0000
Message-ID: <aee0732d-6f8e-17a4-f499-7765acff6482@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hansverk@cisco.com; 
x-originating-ip: [173.38.220.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f93b9a6-6ffa-4f6b-2bc2-08d77efbe749
x-ms-traffictypediagnostic: CY4PR11MB0006:
x-microsoft-antispam-prvs: <CY4PR11MB00067AADA89A3132AB280687DE550@CY4PR11MB0006.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(39860400002)(366004)(396003)(189003)(199004)(316002)(66446008)(6506007)(6512007)(66476007)(66946007)(6916009)(64756008)(91956017)(76116006)(66556008)(2906002)(31686004)(36756003)(8936002)(2616005)(558084003)(186003)(4270600006)(19618925003)(81166006)(86362001)(8676002)(26005)(71200400001)(81156014)(31696002)(6486002)(5660300002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR11MB0006;H:CY4PR11MB0054.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ihc4CVn7uLfHlkZtxWQfAP6Tsv7n40LLhW+Jj+gscm6HoChK2cA4lGJlJvkOnhUPpvG1ARINHs9AB//dPodUFwteknekfFGOofPCGKcXLXTb01Weq+GQXiuzDOQBOeBDvPUqsh57cic/jwjkba10A+5fCCkPjhkPnXkxuo7/b1Nx9/iO7J9PwKuT35JPWozwduh9xmNheKdbWwLoruCEqv1Gq/+DvXYVM9a0ZRKRhfKVO97mRde3QEobA+vIllHkbTKEc2M6zA6/mM5yE9pylhNKejdvwO89gcuMyX4d7LYY71SsHoUAT2VHh7/eS9g9UCFAPdNM20BC8AQ1OnHVWuOlNnnIVcpA2uwYLBB8UkBOXZqdciWX3BaUTrOCwqVZB8dQeT38Cu6ikotMgrkllAkbAkE/i2Yc4kXYioPf8N/u62TIjRhQPL4zDgcQKTaw
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <17ED07D0286E9E4EB34067DF250596F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f93b9a6-6ffa-4f6b-2bc2-08d77efbe749
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 12:07:47.7428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtReQ3iD28/q3YAaR4hqcbzLNMGorK+foKYDuNP+Jc+IAVQa1VBj24wVtfO6/PncR1Rk0LbRjq7nJrQRxZFPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0006
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.17, xch-rcd-007.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SnVzdCBpZ25vcmUhDQoNCglIYW5z
