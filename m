Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D162013BB76
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 09:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgAOIpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 03:45:21 -0500
Received: from mail-eopbgr1300132.outbound.protection.outlook.com ([40.107.130.132]:36192
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726472AbgAOIpU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 03:45:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAJw23mFa4FDRY6g+FqvByTqd1DabPGZyxtes4iHAl3BgFYM7lSL3EjEJSK8pMgnlFqCkO1przL3C6SWrEsSjcCIyipAJAc8fHXIfZgusu7cYfvw05D5nWzf1YRDQV4H7xz3DK1j7Hkc0v/xS6vEsGs56qnNy1JFGxlq/x2Qr3N4JTgeM5d+9WzjZ1sPfzwjZMJMDBs2hivpFafSXVJeWYFsdwz2xb4fo/dTExXt/FoBi8zkbT4QS1C13u6Wfnzjdjf5Hk6VIP9pnFwuxFyZ61ObWkz8amSMP0AJpAb5xiZspFVGYobeuTD8KnYIBpM/ZybnQ+T/zEsNe0CJvJKYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDveEVqv8BPgWycfFR0l5krCr2wgDaHJ/JB4X8mgO9E=;
 b=ApDMyIvjerYARwuprD9OGciPrBDO/hGyW8scqNE2ZVSp+ciHSouPW2aR/rxqtDrIt1NxN8F+LAIrEokysm85vStK1SgQx7KfFwPxeD60XaMFz1xFlmekhAz2VER6K80VEP9pgnP3aDz/1A9CrS6pVdd9sg1RGF5AJKIg7Z5By2J9eNnr1y0n4gtQE/MobNYX3SCKDniUnFehtOBqd+0Sjpdt8angJTgN2T6225qSOXC0LTJQC3YKkR8nIeIcSQIq11v3VyyLURB1B1VOq3xcP8QebGzb2Or8hCVNgbuyFWasCjFMdWIdnQVDPXCC69Eu2zLDJxl+wkMdIzTOzbLCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tataelxsi.co.in; dmarc=pass action=none
 header.from=tataelxsi.co.in; dkim=pass header.d=tataelxsi.co.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tataelxsi.co.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDveEVqv8BPgWycfFR0l5krCr2wgDaHJ/JB4X8mgO9E=;
 b=DGxjrLyxcafHUfF6CZszZWo4FkjEVI2FU8c/Lt+1qdnuvNVfhW1lHlrV2MxpNYEJ1yBubK8zR91aNKzH/Bw9TbyBpZE16je2Q7bBgXrPSE3SvrfuH8Y+xulb1C8CGqRnZxqDz8CHcFczlaULMvpBRf4aTujvsLl1s3dnGlgZw1A=
Received: from SG2PR04MB3221.apcprd04.prod.outlook.com (20.177.90.144) by
 SG2PR04MB2332.apcprd04.prod.outlook.com (20.177.1.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 15 Jan 2020 08:45:10 +0000
Received: from SG2PR04MB3221.apcprd04.prod.outlook.com
 ([fe80::5cb3:6ecd:4f54:8e1e]) by SG2PR04MB3221.apcprd04.prod.outlook.com
 ([fe80::5cb3:6ecd:4f54:8e1e%7]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 08:45:10 +0000
From:   Anjali S S <anjali.ss@tataelxsi.co.in>
To:     "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Vladimir Barinov <vladimir.barinov@cogentembedded.com>" 
        <vladimir.barinov@cogentembedded.com>,
        "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" 
        <laurent.pinchart@ideasonboard.com>,
        "Stuvart S <lovelinuxdeeply@gmail.com>" <lovelinuxdeeply@gmail.com>
Subject: RE: TI Deserializer DT node configuration
Thread-Topic: TI Deserializer DT node configuration
Thread-Index: AQHVx3YY/koiNSMo20q3GEPjGbTF+6frcCPR
Date:   Wed, 15 Jan 2020 08:45:10 +0000
Message-ID: <SG2PR04MB32218D2E1D82311E78AE892EB5370@SG2PR04MB3221.apcprd04.prod.outlook.com>
References: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
 <42a4508d-c199-4ab0-0c62-7387be3b8d55@ideasonboard.com>
 <CAAMGra4cq+hsVcG2A_-WBDiDzkBc+1t8JjEJEhXd8RJb6ocqiw@mail.gmail.com>,<CAAMGra7AVGYSHcqJ1sW30H9ChiSRQq4Tfpx2yfBUkrF4Qf6mEQ@mail.gmail.com>
In-Reply-To: <CAAMGra7AVGYSHcqJ1sW30H9ChiSRQq4Tfpx2yfBUkrF4Qf6mEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anjali.ss@tataelxsi.co.in; 
x-originating-ip: [121.244.192.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 411808fa-247e-45e7-c0f4-08d799973b44
x-ms-traffictypediagnostic: SG2PR04MB2332:
x-microsoft-antispam-prvs: <SG2PR04MB2332D66BB5E05414211473C4B5370@SG2PR04MB2332.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(189003)(199004)(88996005)(8676002)(81166006)(71200400001)(66446008)(5660300002)(66556008)(81156014)(64756008)(66946007)(66476007)(7696005)(8936002)(478600001)(2906002)(186003)(6506007)(55016002)(110136005)(9686003)(26005)(53546011)(52536014)(33656002)(86362001)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:SG2PR04MB2332;H:SG2PR04MB3221.apcprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:3;A:0;
received-spf: None (protection.outlook.com: tataelxsi.co.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n7gDxnBFG3LEc23CMNaidYwOew2JU9Cw88w/neo81enezeuX4iRGhVSDSBRSAnPg8TcMyw/x1iUVvxLYuf8Qibdg8Y8dbvGqRj1e2xIMbIpRFjA+6SXM9f3VjFW5vCV69bG5LoWczuzpaVgY6bv4/7cyK3IFv1V4Hdyd+l0NJrZRO8yR9FBy4LSuvP0aahPNUF7+YdueLFNfIpKtBgrYF45ZMPy5NiC2L03DV/x2Vcj2TelV0lg+c2QLqY5mA/Ehf3rEDzimA3QDB4Lb+yUUXvICXOYlQ/L04d9WXS9tBEm12WIyCC8mZyMxuwFDBYTe9qfXWj05YonF3IWkXkWraYrzaBoYWcmYa9GSHOpeQX6IH3y/uJzteZkDs6L6QXUtSY2ScC5LzPS7+KbNayUYzV97fteFc+7DmZ4paAu2hFrYLdE7U+OFw2SvaWMlJKyF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: tataelxsi.co.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 411808fa-247e-45e7-c0f4-08d799973b44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 08:45:10.8488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad6a39dd-96b6-4368-82da-f2ec4d92e26a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScCse0Ka0TqfPds665orDZotrX38Uz6GEwQOrqjiMOvKjixO5uQQP2kgQ0vIT/NEAPBBcv7NuFAUB29oifn515WojA6SiP7mRlt+ILlxpco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2332
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stuvart,

Thank you for mentioning me.

Hi Team and Barinov,

Sorry for the late response. Updating the progess of our work.
PFB the current status and also the customized devicetree.

root@Alpha:~i2cdetect -y -r 6
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- 0c 0d 0e 0f
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --


 DTS file Modification:

&i2c6 {

pinctrl-0 =3D <&i2c6_pins>;

pinctrl-names =3D "default";

status =3D "okay";

clock-frequency =3D <400000>;


//TI-DESER

ov106xx@0 {
compatible =3D "ovti,ov106xx";
reg =3D <0x60>;
port@0 {
ov106xx_in0: endpoint {
clock-lanes =3D <0>;
data-lanes =3D <1 2 3 4>;
remote-endpoint =3D <&vin0ep0>;
};
};
port@1 {

ov106xx_ti964_des0ep0: endpoint@1 {
remote-endpoint =3D <&ti964_des0ep0>;
};

};
};
ov106xx@1 {
compatible =3D "ovti,ov106xx";
reg =3D <0x61>;
port@0 {
ov106xx_in1: endpoint {
clock-lanes =3D <0>;
data-lanes =3D <1 2 3 4>;
remote-endpoint =3D <&vin1ep0>;
};
};
port@1 {

ov106xx_ti964_des0ep1: endpoint@1 {
remote-endpoint =3D <&ti964_des0ep1>;
};

};
};
ov106xx@2 {
compatible =3D "ovti,ov106xx";
reg =3D <0x62>;
port@0 {
ov106xx_in2: endpoint {
clock-lanes =3D <0>;
data-lanes =3D <1 2 3 4>;
remote-endpoint =3D <&vin2ep0>;
};
};
port@1 {

ov106xx_ti964_des0ep2: endpoint@1 {
remote-endpoint =3D <&ti964_des0ep2>;
};
};
};
ov106xx@3 {
compatible =3D "ovti,ov106xx";
reg =3D <0x63>;
port@0 {
ov106xx_in3: endpoint {
clock-lanes =3D <0>;
data-lanes =3D <1 2 3 4>;
remote-endpoint =3D <&vin3ep0>;
};
};
port@1 {

ov106xx_ti964_des0ep3: endpoint@1 {
remote-endpoint =3D <&ti964_des0ep3>;
};
};
};
/* DS90UB964 @ 0x30 */
ti9x4:ti9x4@30 {

compatible =3D "ti,ti9x4";
reg =3D <0x30>;
ti,sensor_delay =3D <350>;
ti,links =3D <1>;
ti,lanes =3D <1>;
ti,forwarding-mode =3D "round-robin";
ti,stp =3D <0>;
ti,dvp_bus=3D<10>;
ti,hsync=3D<0>;
ti,vsync=3D<1>;
ti,ser_id=3D<0x58>;
ti,poc-delay=3D<50>;

port@0 {
ti964_des0ep0: endpoint@0 {
ti9x3-addr =3D <0x0c>;
dvp-order =3D <0>;
remote-endpoint =3D <&ov106xx_in0>;
};
ti964_des0ep1: endpoint@1 {
ti9x3-addr =3D <0x0d>;
dvp-order =3D <0>;
remote-endpoint =3D <&ov106xx_in1>;
};
ti964_des0ep2: endpoint@2 {
ti9x3-addr =3D <0x0e>;
dvp-order =3D <0>;
remote-endpoint =3D <&ov106xx_in2>;
};
ti964_des0ep3: endpoint@3 {
ti9x3-addr =3D <0x0f>;
dvp-order =3D <0>;
remote-endpoint =3D <&ov106xx_in3>;
};
};
port@1 {
ti964_csi0ep0: endpoint {
csi-rate =3D <800>;
remote-endpoint =3D <&csi40_ep>;
};
};
};

};


Any suggestion is much more appreciated

Regards,
Anjali S S

From: Stuvart S
Sent: 10 January 2020 10:53
To: kieran.bingham@ideasonboard.com; linux-media@vger.kernel.org
Cc: Laurent Pinchart; Vladimir Barinov; Anjali S S
Subject: Re: TI Deserializer DT node configuration


**This is an external email. Please check the sender's full email address (=
not just the sender name) and exercise caution before you respond or click =
any embedded link/attachment.**

Hello team,

Sorry for the long delay happend.Actually I am in the work bench for the la=
st few weeks.We have made some progress on this.Now,Deserializer,serializer=
,Cameras all are detected

We are following Barinov's approach who is CC ed here with.Also since I am =
little busy with some other task,I have included my colleague Anjali in thi=
s mail chain.She can share the latest log and update the progress.

Thank you guys in advance.

On Tue, 26 Nov, 2019, 11:24 PM Stuvart S, <lovelinuxdeeply@gmail.com> wrote=
:
Hi kieran,
> Do you need assistance on this topic in the shorter term to get a functio=
nal system?

yea I need and will be in touch with you for the further assistance

Regards

On Tue, 26 Nov 2019 at 22:22, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Stuvart,
>
> On 26/11/2019 15:55, Stuvart S wrote:
> > Hello team,
> >
> > I am integrating DS90UB964 deserializer into my custom board based on
> > Rcar H3 Salvator XS. Deserializer is connected in i2c6.Also I have my
> > four serializers as DS90UB913 and cameras OV10635.
>
> This sounds like an interesting project.
>
> Our team maintains the RCar H3 multimedia drivers on behalf of Renesas,
> and we have an equivalent system based upon the GMSL (Maxim)
> (de-)serialisers which we have been developing for Renesas.
>
> Can you expand on your use case at all?
>
> Are you creating a product for automotive use cases?
> Or is this something more specific?
>
> Have you selected existing camera modules, or are they also custom design=
ed?
>
> > Can any one please help with the following?
> >
> > How Deserializer connects to Serializer in DT node?I came accross
> > about the terms remote i2c, i2c-mux,i2c-atr.but I dont understand.I am
> > not using any i2c switches.
>
> The serializer and deserializer usually use I2C as the means of
> programming their registers.
>
> You mention that your deserializer is connected on i2c6, this will allow
> communication with the cameras through the deserializer, and serializer
> on a reverse-channel path over I2C. (The cameras are the "remote i2c"
> devices)
>
> With multiple cameras connected to a single interface chip, which
> bridges the I2C channel, means that in effect, the deserializer acts as
> an i2c-mux.
>
> The term i2c-atr is in regards to needing address translation, as each
> camera will be available with identical addressing, whilst logically
> connected to the same bus.
>
>
> > Any DT example is helpful for me
>
> This topic requires support in linux-media/V4L2 which is not currently
> upstreamed.
>
> Any example is dependant upon the code you are basing your development
> on. Have you taken any development branch as an example starting point?
> Or are you using the BSP from Renesas?
>
> Myself, and the rest of our team have been developing support for
> multiplexed streams over CSI2, and working towards getting an upstream
> compatible solution, though it will take some time to get a result
> integrated into the upstream linux tree.
>
> Do you need assistance on this topic in the shorter term to get a
> functional system? If so I believe we could be of some help with our
> specific experience and expertise in this topic.
>
> --
> Regards
> --
> Kieran



--
                        --- Come    Let's enjoy the world of Open Source  -=
--


Best regards,
Stuvart

________________________________
 Disclaimer: This email and any files transmitted with it are confidential =
and intended solely for the use of the individual or entity to whom they ar=
e addressed. If you are not the intended recipient of this message , or if =
this message has been addressed to you in error, please immediately alert t=
he sender by reply email and then delete this message and any attachments. =
If you are not the intended recipient, you are hereby notified that any use=
, dissemination, copying, or storage of this message or its attachments is =
strictly prohibited. Email transmission cannot be guaranteed to be secure o=
r error-free, as information could be intercepted, corrupted, lost, destroy=
ed, arrive late or incomplete, or contain viruses. The sender, therefore, d=
oes not accept liability for any errors, omissions or contaminations in the=
 contents of this message which might have occurred as a result of email tr=
ansmission. If verification is required, please request for a hard-copy ver=
sion.
________________________________
