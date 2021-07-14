Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34583C8A84
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 20:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhGNSQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 14:16:32 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:41331 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhGNSQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 14:16:32 -0400
Date:   Wed, 14 Jul 2021 18:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1626286415;
        bh=EG9s5cdMOG7EmUExUP0PZhifhepV9YS4Df7DmQpR5Cg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=PHZYwtmuTLKCorL5dGE1q1194Yp6y/WzEdAg5vh9VBCs4LrJQ+D7AqjkS/X7QXbHt
         ifFfiXRANUF9O/Eym/4cbZsy8u/+6XIE5WNyJlhiAboUcUO3FuAqrwA3c5J38wHYbH
         xA+h28VLZb9Z19lHyxEnxPd+hVvv3efoHuAddvgA=
To:     Rob Herring <robh@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re:  [PATCH] media: dt-bindings: media: venus: Add firmware-name
Message-ID: <w_oXpbK_lWn1_5cR6AJDWVC_MW4ykO44yTR61UCxS-ifxbyjTmlqksj1DJYERqVyvQBAnxLgJ5-7JEDC8CjgUnuLq7kJbTYVrIVsdxt_D-w=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wednesday, July 14th, 2021 at 10:03 PM, Rob Herring <robh@kernel.org> wr=
ote:

> On Tue, Jun 22, 2021 at 04:20:24PM +0000, Yassine Oudjana wrote:
>
> > Date: Tue, 22 Jun 2021 20:08:25 +0400
> >
> > Subject: [PATCH] media: dt-bindings: media: venus: Add firmware-name
> >
> > Support for parsing the firmware-name property was added a while ago 1,
> >
> > but the dt-bindings were never updated with the new property. This patc=
h
> >
> > adds it to all venus dt-bindings.
> >
> > Signed-off-by: Yassine Oudjana y.oudjana@protonmail.com
> >
> > .../devicetree/bindings/media/qcom,msm8916-venus.yaml | 5 +++++
> >
> > .../devicetree/bindings/media/qcom,msm8996-venus.yaml | 5 +++++
> >
> > .../devicetree/bindings/media/qcom,sc7180-venus.yaml | 5 +++++
> >
> > .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 5 +++++
> >
> > .../devicetree/bindings/media/qcom,sdm845-venus.yaml | 5 +++++
> >
> > 5 files changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus=
.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> >
> > index 59ab16ad12f1..cb1b866d9c37 100644
> >
> > --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> >
> > +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> >
> > @@ -80,6 +80,11 @@ properties:
> >
> > required:
> >
> > - iommus
> >
> > -   firmware-name:
> > -   maxItems: 1
>
> Not an array.
>
Noted.

> Is there a specific pattern and/or default name you can specify?
>
The pattern is usually something like "qcom/<soc>/<device>/venus.mbn", but =
it can be any path really.
The default would be to not set this property.

> > -   description: |
> > -        Relative firmware image path for venus.
> >
> >
> >
> > required:
> >
> > -   compatible
> > -   reg
> >
> >     diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-v=
enus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> >
> >     index 199f45217b4a..b8809325138f 100644
> >
> >     --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.ya=
ml
> >
> >     +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.ya=
ml
> >
> >     @@ -107,6 +107,11 @@ properties:
> >
> >     required:
> >     -   iommus
> >
> > -   firmware-name:
> > -   maxItems: 1
> > -   description: |
> > -        Relative firmware image path for venus.
> >
> >
> >
> > required:
> >
> > -   compatible
> > -   reg
> >
> >     diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-ve=
nus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >
> >     index 04013e5dd044..ffd3e2850366 100644
> >
> >     --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yam=
l
> >
> >     +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yam=
l
> >
> >     @@ -99,6 +99,11 @@ properties:
> >
> >     required:
> >     -   iommus
> >
> > -   firmware-name:
> > -   maxItems: 1
> > -   description: |
> > -        Relative firmware image path for venus.
> >
> >
> >
> > required:
> >
> > -   compatible
> > -   reg
> >
> >     diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-ve=
nus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.=
yaml
> >
> >     index 04b9af4db191..cd7a5e1374ce 100644
> >
> >     --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.=
yaml
> >
> >     +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.=
yaml
> >
> >     @@ -94,6 +94,11 @@ properties:
> >
> >     required:
> >     -   iommus
> >
> > -   firmware-name:
> > -   maxItems: 1
> > -   description: |
> > -        Relative firmware image path for venus.
> >
> >
> >
> > required:
> >
> > -   compatible
> > -   reg
> >
> >     diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-ve=
nus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> >
> >     index 680f37726fdf..ae256238a637 100644
> >
> >     --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yam=
l
> >
> >     +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yam=
l
> >
> >     @@ -108,6 +108,11 @@ properties:
> >
> >     required:
> >     -   iommus
> >
> > -   firmware-name:
> > -   maxItems: 1
> > -   description: |
> > -        Relative firmware image path for venus.
> >
> >
> >
> > required:
> >
> > -   compatible
> > -   reg
> >
> >     --
> >
> >     2.32.0
