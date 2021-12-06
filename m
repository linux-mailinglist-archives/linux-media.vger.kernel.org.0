Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13D946A4AD
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 19:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238859AbhLFShf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 13:37:35 -0500
Received: from mail-mw2nam12hn2205.outbound.protection.outlook.com ([52.100.167.205]:25697
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238059AbhLFShe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Dec 2021 13:37:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2gpE3XFPFtgonfYNMavx4DUuHCvdSKfAnxG71DAvYuk5IDndnHP9Z4mC7OPVga+5GoQtZa8ljapJx5WrrEFf4mmxCg82N25hrNzdNjBavTXUbwiX2p5xQRXHlJEddpjhX7/fR7tQwwtjJh0mJJRxea8P1XtDwyDZz7cRCSWzoTWfcg4as20BWIbd1zoBGXITCLYqKYSNI+VWDfbmyX9TzcOAoD0GbxZsSY/ffTLctqEqkKW06Q7FkC70SNvrIoqrYKmj8DVTcqFcX+EAvD1jVEUYCIOT0oqQJY6ZjTah3WXh0tHvM/CNKYvaIZm/uKLFFSgeE1aIV22NhGJLkkw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=lH2gG2PFL4+JSUi7U2CR7+G1ZaKq2b5zMPVmim2gJWY+F4kLPs6+axYyBAYxUwT4bmKo0arWOSRj0YGYVZAAUCWDMnuUiOdhRh76UZmrR12i2ccHGuSc99BvojwHsFxJBBSVHnTikae1De8Yy5n6AePin/dSYI5EASQj48hA+hVmxlCsPYQ0Wp4M+vN7+5QIC+AGFUVgIGdCprmuMOBn4odPMRjnT7GaAXgrMu+Jg91blJ4PtuOzB80SBvojPDeKPI6S1tGKQQ3R1TfcKOt5JV3DqfNlKgm85rUva5GGJFzAbNgKrQSF321+Tyxm8fK380vL3CogFoxrQwncI10q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=shippinglabels.com
 smtp.mailfrom=msn.com; dmarc=fail (p=none sp=quarantine pct=100) action=none
 header.from=msn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=KpPBrpNtoI2enO9C27AFKfIgJ009C+FG+TQk2LF2Babse0AS4lG0BkSYVwy6s3CUrr0PT58WHM7G3j7Z1iL0ohb/WWKzlpaAb70/ak2ha5LbB1rGIBvSTuVyR16MPiOD8VMdkk68wPWcMfOuvpg61wRQBSPoW9oUStHyonQKP8U=
Received: from DM5PR07CA0060.namprd07.prod.outlook.com (2603:10b6:4:ad::25) by
 SJ0P220MB0462.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:301::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Mon, 6 Dec 2021 18:33:59 +0000
Received: from DM6NAM04FT031.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::f9) by DM5PR07CA0060.outlook.office365.com
 (2603:10b6:4:ad::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Mon, 6 Dec 2021 18:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 DM6NAM04FT031.mail.protection.outlook.com (10.13.158.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:33:58 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 791F29388F;
        Mon,  6 Dec 2021 13:33:20 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:32:38 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <955cd642-9683-4894-a115-fe68cc88cf7c@DM6NAM04FT031.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f6abcf-f315-4d72-6172-08d9b8e6f781
X-MS-TrafficTypeDiagnostic: SJ0P220MB0462:EE_
X-Microsoft-Antispam-PRVS: <SJ0P220MB046261E8C4F8DC844EB5FE93EB6D9@SJ0P220MB0462.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(356005)(9686003)(7596003)(6666004)(6862004)(86362001)(5660300002)(6266002)(316002)(508600001)(82202003)(336012)(26005)(47076005)(2906002)(70206006)(786003)(7116003)(7406005)(31696002)(2860700004)(7416002)(7366002)(6200100001)(70586007)(8936002)(31686004)(956004)(82310400004)(3480700007)(35950700001)(83380400001)(8676002)(40460700001)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkZtQzZlV2tJa3dIWlZnQWZwWVJaQk44V2t4V282eThwWUhMTjVRV3R4UEZh?=
 =?utf-8?B?N0N1RnNkUVMrNTZlWkRsbjVBR0UxbkF2QWk2alk0U0wwRjJjdGxHdHYya1hR?=
 =?utf-8?B?Y3l0c1NoRk1XVWN1ejFjalJCUzh3eGphTjRnL1Y0Y2lkM1drNVk4a0hLdW4r?=
 =?utf-8?B?b2ZoUGlGT1NxSUtLYnRSQnNaTjdORm8vazdkdWRleUVJMzFhcVVFYkl6TUY2?=
 =?utf-8?B?TjIrbEphY0I0U3BQQ2dpSlJONEtibStqS21STzUzM1dtcWovRzEzLzhyOEli?=
 =?utf-8?B?VElKalNhYnd0SWE1bTRoWDRlU1oxZFhrWWdZNnFTV0kwM0hpbDlXMlYwdlUw?=
 =?utf-8?B?aE9qMUd0NjJzTlpPbDdRM3ZvRkpHVHYrRWFpa2R3dHc2M1FQR254Q0MrdTZK?=
 =?utf-8?B?ZDdSbkxIbTE5VUkrRmZwcHRoSWx1RXBVeEJwYXRSK1JFWHQ2dUlEd1M0ai9m?=
 =?utf-8?B?MTQ5QkQ0UWZqczlZWjVkSHR0QitNME1sNE0rYW5mQTZVc1N4V3BpZ3JGWVdX?=
 =?utf-8?B?ZU00dHRJVWlwUUQ4QjY0QkdYTVhlS21NV1FWWWxVaWZHREM2Yllwek8rWXNY?=
 =?utf-8?B?MHdNMG96UktzZXZVV1Jsei94MC9HeStsbERKdGp2K29lTkpBQnVkNWdaOWJV?=
 =?utf-8?B?SjV3RkwxYjUybnAzU2UrbXFKZzFhMVZyN20ycmVhbnJIUjMxZ1cwV3dUY0VD?=
 =?utf-8?B?VWZNdVFtcjBLS0ZHQVZ0OGdNc3VXeGl6M2ZpbExxUnQxakNTbjZFVXc2OThG?=
 =?utf-8?B?T3R6d1pTbTNwUWhRbFZSemdEWnc5T0hVZkJHSW9VaVMvdW1rVThlbEVlSWVw?=
 =?utf-8?B?N3NSOFRJTHR6RDRQK3k4c21GVzVZMm90QkhvSHY0dlBQNmljemFUME0yeHhW?=
 =?utf-8?B?cUZ1UVNCUVdSeFdtc2R6UTA2Y0p3aklOMXViZklwbG92TGFKamFIaVl0OVU1?=
 =?utf-8?B?M3A1VXlqN2ZLRnhRNkN1YUwxWFBlRm1SWmsrN1QvbitKandMT2RaemhkMXJW?=
 =?utf-8?B?OG8xeTA0RlgwaHBOSFVYaHJIeEcrcUhNMmYwUk5rRmJ5a2Q4L3dYQXF2ZFhZ?=
 =?utf-8?B?b3NaYkNldklsUFVGa2p4UFBmazQ0SDY4eEdXcXlzaGZsc3VDaTdsUEE3TnVj?=
 =?utf-8?B?aUlsUEt0LytGRk5aVWtGSy9jLy9mcnFmTWN5SE01VFpMTWNnQXpOL3VKenBj?=
 =?utf-8?B?bTBUWHpXWHZ5cWI5dnpjdGJ4bkgxek1uMHp3bVpZQjNnYkZnK1B2NHJicmY4?=
 =?utf-8?B?ekJES1czNFVSd2JRZjl1VHpnbFBtZG1BWjdydmZuK2tQbGxPZWlNZWdOZlhy?=
 =?utf-8?B?cFBZSXF5ajVSc1dGYTNEbncyckswSG1hNEhxdmt3aFdHTGN1ZVAwWHBveW9U?=
 =?utf-8?B?QlliTDQ4K3c2YW9PczZNbXluQlhzNjUxcVhDV2ptbTFKWHE0M05kWkVPOXNM?=
 =?utf-8?Q?yi8w22zX?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:33:58.2670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f6abcf-f315-4d72-6172-08d9b8e6f781
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM04FT031.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0P220MB0462
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
