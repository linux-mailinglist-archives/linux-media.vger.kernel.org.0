Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6F6C8558
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 19:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjCXSuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 14:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjCXSuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 14:50:01 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363F5270B
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 11:50:00 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 692DA660312E;
        Fri, 24 Mar 2023 18:49:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679683798;
        bh=B1ULdA1N/1dTg/wKvsg/6e1IuSomYHSvlqrhd96D6E8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=J7RjIXa0nRShmBk+zXdFSBfoRYE5OW0n5Xib6vygt56AWN295vIQoqo24Hp/yUZys
         mfuVFaF6/+TmornG/gMZG4COiciZ2hQ0x2thmrX1n8CQDUrRMf3zhaDt9+M80JBzRc
         uAmcR7tbvaSPH197TzqUmJz904Lic0VpDtH0Ok+z6CCZaeXUa+nA2xJZq7ebiB1NH9
         jlENiiZcdTiDYOYe2KC9+y/Jdo1ZO0oGRWkLK8Of7onBI++gnOdzjEjpzogK/r0Q2l
         4T2n5JfMaQyL4UsE+TTC7pwKvZjYe2/+K1M8sJOX171h3FYRP5fVm/bu53I4gbgrfG
         TzVBqydmG9/1g==
Message-ID: <421f8157aa11aab997b092f4b1378a8bbd008c18.camel@collabora.com>
Subject: Re: [RFC 1/2] media: uapi: Add VP8 stateless encoder controls
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
Date:   Fri, 24 Mar 2023 14:49:47 -0400
In-Reply-To: <4ddd59e5-4db3-5027-850c-118230926911@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
         <20230309125651.23911-2-andrzej.p@collabora.com>
         <e0410a7a-250c-851b-147f-a93652e0a131@xs4all.nl>
         <4ddd59e5-4db3-5027-850c-118230926911@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 22 mars 2023 =C3=A0 11:06 +0100, Andrzej Pietrasiewicz a =C3=A9=
crit=C2=A0:
> Hi Hans,
>=20
> W dniu 21.03.2023 o=C2=A014:39, Hans Verkuil pisze:
> > Hi Andrzej,
> >=20
> > On 09/03/2023 13:56, Andrzej Pietrasiewicz wrote:
> > > Add uAPI for stateless VP8 encoders.
> > >=20
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++
> > >   drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
> > >   include/media/v4l2-ctrls.h                |  1 +
> > >   include/uapi/linux/v4l2-controls.h        | 91 ++++++++++++++++++++=
+++
> > >   include/uapi/linux/videodev2.h            |  3 +
> > >   5 files changed, 116 insertions(+)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 29169170880a..5055e75d37bb 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -335,6 +335,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl=
 *ctrl)
> > >   	case V4L2_CTRL_TYPE_VP9_FRAME:
> > >   		pr_cont("VP9_FRAME");
> > >   		break;
> > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > +		pr_cont("VP8_ENCODE_PARAMS");
> > > +		break;
> > >   	case V4L2_CTRL_TYPE_HEVC_SPS:
> > >   		pr_cont("HEVC_SPS");
> > >   		break;
> > > @@ -568,6 +571,7 @@ static int std_validate_compound(const struct v4l=
2_ctrl *ctrl, u32 idx,
> > >   	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> > >   	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > >   	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> > > +	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
> > >   	struct v4l2_area *area;
> > >   	void *p =3D ptr.p + idx * ctrl->elem_size;
> > >   	unsigned int i;
> > > @@ -918,6 +922,15 @@ static int std_validate_compound(const struct v4=
l2_ctrl *ctrl, u32 idx,
> > >   			return -EINVAL;
> > >   		break;
> > >  =20
> > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > +		p_vp8_encode_params =3D p;
> > > +		if (p_vp8_encode_params->loop_filter_level > 63)
> > > +			return -EINVAL;
> > > +
> > > +		if (p_vp8_encode_params->sharpness_level > 7)
> > > +			return -EINVAL;
> > > +		break;
> > > +
> > >   	default:
> > >   		return -EINVAL;
> > >   	}
> > > @@ -1602,6 +1615,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v=
4l2_ctrl_handler *hdl,
> > >   	case V4L2_CTRL_TYPE_VP9_FRAME:
> > >   		elem_size =3D sizeof(struct v4l2_ctrl_vp9_frame);
> > >   		break;
> > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > +		elem_size =3D sizeof(struct v4l2_ctrl_vp8_encode_params);
> > > +		break;
> > >   	case V4L2_CTRL_TYPE_AREA:
> > >   		elem_size =3D sizeof(struct v4l2_area);
> > >   		break;
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> > > index 564fedee2c88..935bd9a07bad 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1182,6 +1182,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >   	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quanti=
sation Matrices";
> > >   	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilit=
ies Updates";
> > >   	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Para=
meters";
> > > +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode Para=
meters";
> > > +	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP";
> > >   	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Paramete=
r Set";
> > >   	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter=
 Set";
> > >   	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Par=
ameters";
> > > @@ -1531,6 +1533,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
enum v4l2_ctrl_type *type,
> > >   	case V4L2_CID_STATELESS_VP9_FRAME:
> > >   		*type =3D V4L2_CTRL_TYPE_VP9_FRAME;
> > >   		break;
> > > +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
> > > +		*type =3D V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
> > > +		break;
> >=20
> > Why isn't V4L2_CID_STATELESS_VP8_ENCODE_QP added here as well? I assume=
 it is of
> > type INTEGER?
> >=20
>=20
> Thanks for pointing that.
>=20
> And it is a simple integer, indeed.
>=20
> > I also wonder if VP9 would have the same control, so that this could be=
 called
> > V4L2_CID_STATELESS_VPX_ENCODE_QP. On the other hand, that might be over=
kill.
> >=20
>=20
> It seems to me that having a single kind of control for passing the
> requested QP value for both VP8 and VP9 makes sense. In fact, perhaps not
> restricting ourselves to VPX would make even more sense?
>=20
> This touches the question of how we do rate control in general in statele=
ss
> encoders. If the uAPI is to be independent of underlying hardware, then t=
he only
> parameter userspace passes to the kernel is the required QP (which is det=
ermined
> entirely by userspace using whatever means it considers appropriate, for =
example
> judging by the last encoded frame(s) size(s)). Any other kinds of data wo=
uld
> probably be somehow hardware-specific. So, I'm wondering if maybe even a
>=20
> V4L2_CID_STATELESS_ENCODE_QP
>=20
> is what we want?

We already have V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY which is bound to
V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, which seems what we should expect form a
stateless encoder. In fact, adding the entire BITRATE_MODE would enable lat=
er
encoder that has firmware driven rate control to be able to add it easily
(similar to what we have in GPUs).

We don't need per frame type QP, as stateless encoder have requests, so we =
can
set the QP for each frame separately anyway.

>=20
> This, in turn, brings another question of the range and interpretation of=
 values
> that should be passed through this control. 0-255? 0-100? 0 =3D no quanti=
zation at
> all (i.e. highest quality) or maybe 0 =3D lowest possible quality?

It seems V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY has decided to go 0-100 regar=
dless
of the CODEC. The API is not very inconsistent, like VPX_IN_QP does not eve=
n
document a range, and says its for VP8 only. Perhaps we could open it up, a=
nd
allow per codec range so we can match 1:1 with the CODEC specs ? We could o=
nly
allow that for stateless if we beleive abstracting it to 0-100 make is bett=
er in
general. Just that in stateless, we expect that number to be written in the
bitstream verbatim.

Nicolas
