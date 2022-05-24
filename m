Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF425323DB
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbiEXHQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 03:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbiEXHQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 03:16:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E120B5B3ED
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 00:16:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72B944A8;
        Tue, 24 May 2022 09:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1653376613;
        bh=JVVRPsiGczsgeNC9L9YBdyMJH6rW+eUC7vKSABOVKWY=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=NqVciWG9FDtfLV6I8pwFIuIJmPSMox8UdJ6TjMwqvP+UK1e/y53/5U2f7d3z3LZ7D
         Qs9J1wVMrCQ1ONMtuJNSH3wl0qGJgbEBLtEEFqs26JsoBIfxqddHisWq+gt6uKBFUy
         611cc0fx9sTgTQODKwyuPjJeP1+yr8vkaNl+9epo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Date:   Tue, 24 May 2022 08:16:51 +0100
Message-ID: <165337661126.402452.10107682065782670158@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Quoting Hans Verkuil (2022-05-06 14:20:09)
> Hi all,
>=20
> Since countries are opening up again and travel is (at least for now!) a =
lot easier,
> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
>=20
> See here for more details about the conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/
>=20
> Of course, this only makes sense if there is something to talk about. So =
please reply
> with any suggestions for topics!
>=20
> Also please let me know if you would expect to be at such a media summit =
in person.
> If only a few people would be there, then there isn't much point to this.
>=20
>=20
> I have two topics:
>=20
> 1) Discussion of the media subsystem development process: any bottlenecks=
, any ideas
>    for improvements?
>=20
> 2) I can give a presentation on the work I've done in the CTA-861 standar=
d (used by
>    HDMI) and the edid-decode utility.
>=20
> I'd like to make a decision on whether or not it is worthwhile to do this=
 in a week
> or two. If we wait too long it might be difficult to get a room for the s=
ummit.

I would like to bring up the 'fault tolerance' topic again if I can. I
raised this in the past when we first started hitting the issue on
Renesas platforms with multiple cameras in a single media graph, but now
I think it's become more critical with desktop / laptop devices that are
hitting the issue (i.e. the IPU3).

Summary of issue:

 - Multiple cameras that can function independently successfully, are
   prevented from functioning or fully probing by V4L2 if one component
   of another camera fails to load or probe.
 =20
   If Camera A has a VCM, and Camera B does not, Camera B will not be
   available at all if Camera A's VCM is not fully probed, even though
   Camera B can be fully functional and complete.

   Even if Camera A does not have the VCM probed, it may still function
   successfully (with a fixed focal position) - but our current
   implementation will mean that it will not even be available to
   capture images.

We talked about this quite a long time ago, and I believe the general
consensus was that we can have events on the media graph. But
unfortunately at the time, there was no development scheduled on that,
and it wasn't something I was able to continue at the time.

I'd like to bring it up to refresh the topic, and see if we can make
some progress as it's now affecting more general devices.

--
Kieran



>=20
> Regards,
>=20
>         Hans
