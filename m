Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C5513BBBA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 10:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgAOJAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 04:00:05 -0500
Received: from mail-eopbgr1310109.outbound.protection.outlook.com ([40.107.131.109]:25440
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726513AbgAOJAE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 04:00:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2GjETPS19XFBxjprnpu15qmzJ3zoGWN0gj8jS1v+YffXjcdlT45RAYbtZU39eSRMouQo8wV9x1QanZ4nQvCfFE8xxxHAxOomWO1n38TQHyqMaoBXKUKkifDKDPkOubVXXClyT4kxSraGVMVqniW2lEIIPzqUDyrDLM70MC1XnG+oWwv1ZdMp1QwrphidaIAi2HLEn5uiJ3jGCMl3BJs6m4DrlWW4hFMx1QDFhkJGa4ub8ph9Tpobcc5slOCERPXl6vgQh2LHmyBxsI8s+NMl6Lj+kxga0ToEx5GMT+GB39bcKtNk1ZRpiFhXW6fhiYa0stBTY2QKXq/nDIJU1loiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38F+gcuho+2GNa1A1erQZs6Sc1xPbFvoSJ/OQAwJXQY=;
 b=MOGWuo1DQm3tpXHWIPtnc0DAfT74D0oQLcF2aYLcAd19CgjrjbC9xdXc/u0Cfv5QowJC2U3EkTgVy9/P/ifRoLTLumkuYjOeNCNGRcSh5yj+IiAka4cp4cseNSC+mrJKBKIbhQvgs/GWDdSHyx9811OKHyjS+JzudGrrehB2cscD140VvlDm3uN8oAAfFPM96TZqV5an+7wy/FareZZA2xhqLTsxAZ8jnS1huDGxDXW7bDZt1Thkl7Xfaa3/bIQDXtjRweV7gYaOPtDOmLljw9YyNb54Xlk2Ps4wnBI/ag2s5TZNlBa9goysR/AD9h9WAEDRbwiiV1EcBxwdt3DbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tataelxsi.co.in; dmarc=pass action=none
 header.from=tataelxsi.co.in; dkim=pass header.d=tataelxsi.co.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tataelxsi.co.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38F+gcuho+2GNa1A1erQZs6Sc1xPbFvoSJ/OQAwJXQY=;
 b=Ty8e3COoMBxCARRTV5OZzAfGNexj81xCv9jH6z3TE0NMLwr3hCznyuAZ30y07YyqqLUV6dSClA6iRszRCT2ryJAZdP0AWVROe8CPSU8PHzNw0ViMKwQ40BclJkkjC5OVQeOTqVBHh2Oa3wsw/kL50aOAQfFXxMGC7/ZTG4G3FgI=
Received: from SG2PR04MB3221.apcprd04.prod.outlook.com (20.177.90.144) by
 SG2PR04MB2905.apcprd04.prod.outlook.com (20.177.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Wed, 15 Jan 2020 08:59:58 +0000
Received: from SG2PR04MB3221.apcprd04.prod.outlook.com
 ([fe80::5cb3:6ecd:4f54:8e1e]) by SG2PR04MB3221.apcprd04.prod.outlook.com
 ([fe80::5cb3:6ecd:4f54:8e1e%7]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 08:59:58 +0000
From:   Anjali S S <anjali.ss@tataelxsi.co.in>
To:     "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: TI Deserializer DT node configuration
Thread-Topic: TI Deserializer DT node configuration
Thread-Index: AQHVx3YY/koiNSMo20q3GEPjGbTF+6frdTRU
Date:   Wed, 15 Jan 2020 08:59:57 +0000
Message-ID: <SG2PR04MB3221BAA4E843539E9E4138B9B5370@SG2PR04MB3221.apcprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 8b3095bf-ed89-4943-5f32-08d799994c08
x-ms-traffictypediagnostic: SG2PR04MB2905:
x-microsoft-antispam-prvs: <SG2PR04MB2905639F6074053D11A83EC3B5370@SG2PR04MB2905.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(189003)(199004)(76116006)(91956017)(52536014)(2906002)(86362001)(33656002)(5660300002)(66556008)(66946007)(71200400001)(66476007)(53546011)(6506007)(64756008)(66446008)(7696005)(9686003)(316002)(81156014)(8676002)(508600001)(110136005)(81166006)(8936002)(55016002)(186003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:SG2PR04MB2905;H:SG2PR04MB3221.apcprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: tataelxsi.co.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ltcXTzKuDfGkQeanvbgy+IXvSvbBe6VdX/PdoH4gjSNvHjQT07Hdn5g2LOftOrL5wirg7oNwwtJZpp/8fqvtV6ZU2GidMP2KBo5hCPNmZnjxfWs24fFGYhSLSZSdAXYwj8BaJaHAxxSgMceJLUnvn92pbtaH/mLo39yXrvLW5MaUufUxxRoMMbb/B8oA9fG52ohP/mppVjtuSv0R7C/BhKb9NRHHLWtRBwI97JNGnl2qLBHYJmwyGs8Kl+se8V3Jo71qP/67IfjoTvElNeYRPIsFf1i73hqUxYx95PrfIQITXgBbaCZXy6Fir4hEFI7pDthZhwJRNkQ29MjuLzr/2tTA7pMf2fbV4XoFVocIDCJz0nzLMZKslS2EcJ6l7wfYcqd86VKZ+QmArK2bZdpXJmCXTuKHnQ4801MA5xOoI0z7hhcXPxZ/pVDxFDJCXAZe
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: tataelxsi.co.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3095bf-ed89-4943-5f32-08d799994c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 08:59:57.9528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad6a39dd-96b6-4368-82da-f2ec4d92e26a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3giePp9/C4FSpSkoT2+jvl+OJCZ67R72ggjmA8DX//1in5zw3zqbekA0hpaYwMb58uh2z2HQhm7hF64Td1l/Hls0RFkKzwv6d0DbhbaMfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2905
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stuvart,

Thank you for mentioning me.

Hi Team and Barinov,

Sorry for the late response. Updating the progess of our
work.
PFB the current status and also the customized
devicetree.

root@Alpha:~i2cdetect -y -r 6
     0  1
2  3  4  5  6
7  8  9
a  b  c
d  e  f
00:          -- --
-- -- -- -- -- -- -- 0c 0d 0e 0f
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --


 DTS file
Modification:

&i2c6 {

                                pinctrl-0
=3D <&i2c6_pins>;

                                pinctrl-names
=3D "default";

                                status
=3D "okay";

                                clock-frequency
=3D <400000>;


                //TI-DESER

                ov106xx@0
{
                                compatible
=3D "ovti,ov106xx";
                                reg
=3D <0x60>;
                                port@0
{
                                                ov106xx_in0:
endpoint {
                                                                clock-lanes
=3D <0>;
                                                                data-lanes
=3D <1 2 3 4>;
                                                                remote-endp=
oint
=3D <&vin0ep0>;
                                                };
                                };
                                port@1
{

                                                ov106xx_ti964_des0ep0:
endpoint@1 {
                                                                remote-endp=
oint
=3D <&ti964_des0ep0>;
                                                };

                                };
                };
                ov106xx@1
{
                                compatible
=3D "ovti,ov106xx";
                                reg
=3D <0x61>;
                                port@0
{
                                                ov106xx_in1:
endpoint {
                                                                clock-lanes
=3D <0>;
                                                                data-lanes
=3D <1 2 3 4>;
                                                                remote-endp=
oint
=3D <&vin1ep0>;
                                                };
                                };
                                port@1
{

                                                ov106xx_ti964_des0ep1:
endpoint@1 {
                                                                remote-endp=
oint
=3D <&ti964_des0ep1>;
                                                };

                                };
                };
                ov106xx@2
{
                                compatible
=3D "ovti,ov106xx";
                                reg
=3D <0x62>;
                                port@0
{
                                                ov106xx_in2:
endpoint {
                                                                clock-lanes
=3D <0>;
                                                                data-lanes
=3D <1 2 3 4>;
                                                                remote-endp=
oint
=3D <&vin2ep0>;
                                                };
                                };
                                port@1
{

                                                ov106xx_ti964_des0ep2:
endpoint@1 {
                                                                remote-endp=
oint
=3D <&ti964_des0ep2>;
                                                };
                                };
                };
                ov106xx@3
{
                                compatible
=3D "ovti,ov106xx";
                                reg
=3D <0x63>;
                                port@0
{
                                                ov106xx_in3:
endpoint {
                                                                clock-lanes
=3D <0>;
                                                                data-lanes
=3D <1 2 3 4>;
                                                                remote-endp=
oint
=3D <&vin3ep0>;
                                                };
                                };
                                port@1
{

                                                ov106xx_ti964_des0ep3:
endpoint@1 {
                                                                remote-endp=
oint
=3D <&ti964_des0ep3>;
                                                };
                                };
                };
                /*
DS90UB964 @ 0x30 */
                ti9x4:ti9x4@30
{

                                compatible
=3D "ti,ti9x4";
                                reg
=3D <0x30>;
                                ti,sensor_delay
=3D <350>;
                                ti,links
=3D <1>;
                                ti,lanes
=3D <1>;
                                ti,forwarding-mode
=3D "round-robin";
                                ti,stp
=3D <0>;
                                ti,dvp_bus=3D<10>;
                                ti,hsync=3D<0>;
                                ti,vsync=3D<1>;
                                ti,ser_id=3D<0x58>;
                                ti,poc-delay=3D<50>;

                                port@0
{
                                                ti964_des0ep0:
endpoint@0 {
                                                                ti9x3-addr
=3D <0x0c>;
                                                                dvp-order
=3D <0>;
                                                                remote-endp=
oint
=3D <&ov106xx_in0>;
                                                };
                                                ti964_des0ep1:
endpoint@1 {
                                                                ti9x3-addr
=3D <0x0d>;
                                                                dvp-order
=3D <0>;
                                                                remote-endp=
oint
=3D <&ov106xx_in1>;
                                                };
                                                ti964_des0ep2:
endpoint@2 {
                                                                ti9x3-addr
=3D <0x0e>;
                                                                dvp-order
=3D <0>;
                                                                remote-endp=
oint
=3D <&ov106xx_in2>;
                                                };
                                                ti964_des0ep3:
endpoint@3 {
                                                                ti9x3-addr
=3D <0x0f>;
                                                                dvp-order
=3D <0>;
                                                                remote-endp=
oint
=3D <&ov106xx_in3>;
                                                };
                                };
                                port@1
{
                                                ti964_csi0ep0:
endpoint {
                                                                csi-rate
=3D <800>;
                                                                remote-endp=
oint
=3D <&csi40_ep>;
                                                };
                                };
                };

};


Any suggestion is much more appreciated

Regards,
Anjali S S







From: Stuvart S <lovelinuxdeeply@gmail.com>

Sent: Friday, January 10, 2020 10:53 AM

To: kieran.bingham@ideasonboard.com <kieran.bingham@ideasonboard.com>; linu=
x-media@vger.kernel.org <linux-media@vger.kernel.org>

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Vladimir Barinov =
<vladimir.barinov@cogentembedded.com>; Anjali S S <anjali.ss@tataelxsi.co.i=
n>

Subject: Re: TI Deserializer DT node configuration






**This is an external email. Please check the sender=92s full email address=
 (not just the sender name) and exercise caution before
 you respond or click any embedded link/attachment.**



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
