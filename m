Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B836D2361
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjCaPAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 11:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbjCaPAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:00:10 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAA91D933
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 07:59:52 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:a07e::580])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BD8D7660319A;
        Fri, 31 Mar 2023 15:59:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680274790;
        bh=xv/rpdUq4p5K5XILaYm5iabxVB2D5+/1ru7CEpOaTtM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Rf0wfvFRYoFK0vqowseBXIsQaxFm9YBmVjbHxnHSZarHYs189Mu5ISSXjdMPAqSe6
         79hRjh+i3m2dQ4huNaLKFd2p2TdgdD5ArqXpDAHM9RaZiCEwhwVMQz3V4EMGFHa64M
         QrGdoPWlMwKg5/UdkbmuC3p+rSW5vykuYmrtDnH7v8DMrmmIFhEwwlVe8/VD6nAhEE
         WI1Kss9TIixm8182WZ/nv3ZplA5ESFAjsm8yaopvVf85Ih2mMbRR92/e5jjD/I4Nb7
         9eAYUv2bJdKJ6dR37IJCCGN3EAqY1eqwEGnkN4ARU8n1Tgqw7jPZFbGIj3f3FxIouv
         9rmfepla2WoLw==
Message-ID: <e9ed845111cf791650156c85e1c7c0765749f256.camel@collabora.com>
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
Date:   Fri, 31 Mar 2023 10:59:41 -0400
In-Reply-To: <0224abd9-df5b-0c79-6366-a52176a2e45b@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
         <20230309125651.23911-2-andrzej.p@collabora.com>
         <e0410a7a-250c-851b-147f-a93652e0a131@xs4all.nl>
         <4ddd59e5-4db3-5027-850c-118230926911@collabora.com>
         <421f8157aa11aab997b092f4b1378a8bbd008c18.camel@collabora.com>
         <0224abd9-df5b-0c79-6366-a52176a2e45b@collabora.com>
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

Hi,

Le lundi 27 mars 2023 =C3=A0 14:53 +0200, Andrzej Pietrasiewicz a =C3=A9cri=
t=C2=A0:
> Hi,
>=20
> W dniu 24.03.2023 o=C2=A019:49, Nicolas Dufresne pisze:
> > Le mercredi 22 mars 2023 =C3=A0 11:06 +0100, Andrzej Pietrasiewicz a =
=C3=A9crit=C2=A0:
> > > Hi Hans,
> > >=20
> > > W dniu 21.03.2023 o=C2=A014:39, Hans Verkuil pisze:
> > > > Hi Andrzej,
> > > >=20
> > > > On 09/03/2023 13:56, Andrzej Pietrasiewicz wrote:
> > > > > Add uAPI for stateless VP8 encoders.
> > > > >=20
> > > > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > > > ---
> > > > >    drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++
> > > > >    drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
> > > > >    include/media/v4l2-ctrls.h                |  1 +
> > > > >    include/uapi/linux/v4l2-controls.h        | 91 +++++++++++++++=
++++++++
> > > > >    include/uapi/linux/videodev2.h            |  3 +
> > > > >    5 files changed, 116 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/=
media/v4l2-core/v4l2-ctrls-core.c
> > > > > index 29169170880a..5055e75d37bb 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > > > @@ -335,6 +335,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_=
ctrl *ctrl)
> > > > >    	case V4L2_CTRL_TYPE_VP9_FRAME:
> > > > >    		pr_cont("VP9_FRAME");
> > > > >    		break;
> > > > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > > > +		pr_cont("VP8_ENCODE_PARAMS");
> > > > > +		break;
> > > > >    	case V4L2_CTRL_TYPE_HEVC_SPS:
> > > > >    		pr_cont("HEVC_SPS");
> > > > >    		break;
> > > > > @@ -568,6 +571,7 @@ static int std_validate_compound(const struct=
 v4l2_ctrl *ctrl, u32 idx,
> > > > >    	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> > > > >    	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > > > >    	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> > > > > +	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
> > > > >    	struct v4l2_area *area;
> > > > >    	void *p =3D ptr.p + idx * ctrl->elem_size;
> > > > >    	unsigned int i;
> > > > > @@ -918,6 +922,15 @@ static int std_validate_compound(const struc=
t v4l2_ctrl *ctrl, u32 idx,
> > > > >    			return -EINVAL;
> > > > >    		break;
> > > > >   =20
> > > > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > > > +		p_vp8_encode_params =3D p;
> > > > > +		if (p_vp8_encode_params->loop_filter_level > 63)
> > > > > +			return -EINVAL;
> > > > > +
> > > > > +		if (p_vp8_encode_params->sharpness_level > 7)
> > > > > +			return -EINVAL;
> > > > > +		break;
> > > > > +
> > > > >    	default:
> > > > >    		return -EINVAL;
> > > > >    	}
> > > > > @@ -1602,6 +1615,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(stru=
ct v4l2_ctrl_handler *hdl,
> > > > >    	case V4L2_CTRL_TYPE_VP9_FRAME:
> > > > >    		elem_size =3D sizeof(struct v4l2_ctrl_vp9_frame);
> > > > >    		break;
> > > > > +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> > > > > +		elem_size =3D sizeof(struct v4l2_ctrl_vp8_encode_params);
> > > > > +		break;
> > > > >    	case V4L2_CTRL_TYPE_AREA:
> > > > >    		elem_size =3D sizeof(struct v4l2_area);
> > > > >    		break;
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/=
media/v4l2-core/v4l2-ctrls-defs.c
> > > > > index 564fedee2c88..935bd9a07bad 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > @@ -1182,6 +1182,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > > >    	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Q=
uantisation Matrices";
> > > > >    	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Proba=
bilities Updates";
> > > > >    	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode=
 Parameters";
> > > > > +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode =
Parameters";
> > > > > +	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP"=
;
> > > > >    	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Par=
ameter Set";
> > > > >    	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Para=
meter Set";
> > > > >    	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slic=
e Parameters";
> > > > > @@ -1531,6 +1533,9 @@ void v4l2_ctrl_fill(u32 id, const char **na=
me, enum v4l2_ctrl_type *type,
> > > > >    	case V4L2_CID_STATELESS_VP9_FRAME:
> > > > >    		*type =3D V4L2_CTRL_TYPE_VP9_FRAME;
> > > > >    		break;
> > > > > +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
> > > > > +		*type =3D V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
> > > > > +		break;
> > > >=20
> > > > Why isn't V4L2_CID_STATELESS_VP8_ENCODE_QP added here as well? I as=
sume it is of
> > > > type INTEGER?
> > > >=20
> > >=20
> > > Thanks for pointing that.
> > >=20
> > > And it is a simple integer, indeed.
> > >=20
> > > > I also wonder if VP9 would have the same control, so that this coul=
d be called
> > > > V4L2_CID_STATELESS_VPX_ENCODE_QP. On the other hand, that might be =
overkill.
> > > >=20
> > >=20
> > > It seems to me that having a single kind of control for passing the
> > > requested QP value for both VP8 and VP9 makes sense. In fact, perhaps=
 not
> > > restricting ourselves to VPX would make even more sense?
> > >=20
> > > This touches the question of how we do rate control in general in sta=
teless
> > > encoders. If the uAPI is to be independent of underlying hardware, th=
en the only
> > > parameter userspace passes to the kernel is the required QP (which is=
 determined
> > > entirely by userspace using whatever means it considers appropriate, =
for example
> > > judging by the last encoded frame(s) size(s)). Any other kinds of dat=
a would
> > > probably be somehow hardware-specific. So, I'm wondering if maybe eve=
n a
> > >=20
> > > V4L2_CID_STATELESS_ENCODE_QP
> > >=20
> > > is what we want?
> >=20
> > We already have V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY which is bound to
> > V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
>=20
> Nice catch. Both are used only by Venus. We could reuse it. But then ther=
e's
> the allowed range - which you do discuss below.
>=20
>=20
> which seems what we should expect form a
> > stateless encoder. In fact, adding the entire BITRATE_MODE would enable=
 later
> > encoder that has firmware driven rate control to be able to add it easi=
ly
> > (similar to what we have in GPUs).
> >=20
> > We don't need per frame type QP, as stateless encoder have requests, so=
 we can
> > set the QP for each frame separately anyway.
> >=20
> > >=20
> > > This, in turn, brings another question of the range and interpretatio=
n of values
> > > that should be passed through this control. 0-255? 0-100? 0 =3D no qu=
antization at
> > > all (i.e. highest quality) or maybe 0 =3D lowest possible quality?
> >=20
> > It seems V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY has decided to go 0-100 r=
egardless
> > of the CODEC. The API is not very inconsistent, like VPX_IN_QP does not=
 even
> > document a range, and says its for VP8 only. Perhaps we could open it u=
p, and
> > allow per codec range so we can match 1:1 with the CODEC specs ? We cou=
ld only
> > allow that for stateless if we beleive abstracting it to 0-100 make is =
better in
> > general. Just that in stateless, we expect that number to be written in=
 the
> > bitstream verbatim.
> >=20
>=20
> Do you mean to relax the 0-100 range of V4L2_CID_MPEG_VIDEO_CONSTANT_QUAL=
ITY
> and then use this control instead of adding a new one for stateless codec=
s,
> or to specifically add a new one, modeled after
> V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY?


Yes, I'd relax the range overall. And then, specifically for stateless, I'd
require it to match the codec spec specified range.

>=20
> Regards,
>=20
> Andrzej

