Return-Path: <linux-media+bounces-67-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D07E849A
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3564A1C20B36
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DB93C08B;
	Fri, 10 Nov 2023 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B53C079
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 20:44:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170CB4786;
	Fri, 10 Nov 2023 12:44:40 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 733F366073EC;
	Fri, 10 Nov 2023 20:44:38 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231030193406.70126-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 20:44:38 +0000
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, "Mauro Carvalho Chehab" <mchehab@kernel.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6093-654e9600-1-67fa3a80@264835385>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/2] =?utf-8?q?visl=3A?= Add AV1 support
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

Hi Detlev!

On Monday, October 30, 2023 16:27 -03, Detlev Casanova <detlev.casanova=
@collabora.com> wrote:

> Let the visl test driver accept the AV1 pixel format.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/media/test-drivers/visl/visl-core.c   |  21 ++
>  drivers/media/test-drivers/visl/visl-dec.c    |  70 +++-
>  drivers/media/test-drivers/visl/visl-dec.h    |   8 +
>  .../media/test-drivers/visl/visl-trace-av1.h  | 314 ++++++++++++++++=
++
>  .../test-drivers/visl/visl-trace-points.c     |   1 +
>  drivers/media/test-drivers/visl/visl-video.c  |  18 +
>  drivers/media/test-drivers/visl/visl-video.h  |   1 +
>  drivers/media/test-drivers/visl/visl.h        |   1 +
>  8 files changed, 433 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
>=20
> diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/me=
dia/test-drivers/visl/visl-core.c
> index 9970dc739ca5..68dac896277b 100644
> --- a/drivers/media/test-drivers/visl/visl-core.c
> +++ b/drivers/media/test-drivers/visl/visl-core.c
> @@ -211,6 +211,27 @@ const struct visl=5Fctrls visl=5Fhevc=5Fctrls =3D=
 {
>  	.num=5Fctrls =3D ARRAY=5FSIZE(visl=5Fhevc=5Fctrl=5Fdescs),
>  };
> =20
> +static const struct visl=5Fctrl=5Fdesc visl=5Fav1=5Fctrl=5Fdescs[] =3D=
 {
> +	{
> +		.cfg.id =3D V4L2=5FCID=5FSTATELESS=5FAV1=5FFRAME,
> +	},
> +	{
> +		.cfg.id =3D V4L2=5FCID=5FSTATELESS=5FAV1=5FTILE=5FGROUP=5FENTRY,
> +		.cfg.dims =3D { V4L2=5FAV1=5FMAX=5FTILE=5FCOUNT },
> +	},
> +	{
> +		.cfg.id =3D V4L2=5FCID=5FSTATELESS=5FAV1=5FSEQUENCE,
> +	},
> +	{
> +		.cfg.id =3D V4L2=5FCID=5FSTATELESS=5FAV1=5FFILM=5FGRAIN,
> +	},
> +};
> +
> +const struct visl=5Fctrls visl=5Fav1=5Fctrls =3D {
> +	.ctrls =3D visl=5Fav1=5Fctrl=5Fdescs,
> +	.num=5Fctrls =3D ARRAY=5FSIZE(visl=5Fav1=5Fctrl=5Fdescs),
> +};
> +
>  struct v4l2=5Fctrl *visl=5Ffind=5Fcontrol(struct visl=5Fctx *ctx, u3=
2 id)
>  {
>  	struct v4l2=5Fctrl=5Fhandler *hdl =3D &ctx->hdl;
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/med=
ia/test-drivers/visl/visl-dec.c
> index 318d675e5668..684feb6fde58 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -13,6 +13,7 @@
>  #include "visl-trace-vp9.h"
>  #include "visl-trace-h264.h"
>  #include "visl-trace-hevc.h"
> +#include "visl-trace-av1.h"
> =20
>  #include <linux/delay.h>
>  #include <linux/workqueue.h>
> @@ -152,6 +153,61 @@ static void visl=5Fget=5Fref=5Fframes(struct vis=
l=5Fctx *ctx, u8 *buf,
> =20
>  		break;
>  	}
> +
> +	case VISL=5FCODEC=5FAV1: {
> +		int idx=5Fintra =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FINTRA=5FFRAME];
> +		int idx=5Flast =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FLAST=5FFRAME];
> +		int idx=5Flast2 =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FLAST2=5FFRAME];
> +		int idx=5Flast3 =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FLAST3=5FFRAME];
> +		int idx=5Fgolden =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FGOLDEN=5FFRAME];
> +		int idx=5Fbwd =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5FR=
EF=5FBWDREF=5FFRAME];
> +		int idx=5Falt2 =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5F=
REF=5FALTREF2=5FFRAME];
> +		int idx=5Falt =3D run->av1.frame->ref=5Fframe=5Fidx[V4L2=5FAV1=5FR=
EF=5FALTREF=5FFRAME];
> +
> +		struct vb2=5Fbuffer *ref=5Fintra =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Fintra]);
> +		struct vb2=5Fbuffer *ref=5Flast =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Flast]);
> +		struct vb2=5Fbuffer *ref=5Flast2 =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Flast2]);
> +		struct vb2=5Fbuffer *ref=5Flast3 =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Flast3]);
> +		struct vb2=5Fbuffer *ref=5Fgolden =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Fgolden]);
> +		struct vb2=5Fbuffer *ref=5Fbwd =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Fbwd]);
> +		struct vb2=5Fbuffer *ref=5Falt2 =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Falt2]);
> +		struct vb2=5Fbuffer *ref=5Falt =3D
> +			vb2=5Ffind=5Fbuffer(cap=5Fq, run->av1.frame->reference=5Fframe=5F=
ts[idx=5Falt]);
> +
> +		scnprintf(buf, buflen,
> +			  "ref=5Fintra=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Flast=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Flast2=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Flast3=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Fgolden=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Fbwd=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Falt2=5Fts: %llu, vb2=5Fidx: %d\n"
> +			  "ref=5Falt=5Fts: %llu, vb2=5Fidx: %d\n",
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Fintra],
> +			  ref=5Fintra ? ref=5Fintra->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Flast],
> +			  ref=5Flast ? ref=5Flast->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Flast2],
> +			  ref=5Flast2 ? ref=5Flast2->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Flast3],
> +			  ref=5Flast3 ? ref=5Flast3->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Fgolden],
> +			  ref=5Fgolden ? ref=5Fgolden->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Fbwd],
> +			  ref=5Fbwd ? ref=5Fbwd->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Falt2],
> +			  ref=5Falt2 ? ref=5Falt2->index : -1,
> +			  run->av1.frame->reference=5Fframe=5Fts[idx=5Falt],
> +			  ref=5Falt ? ref=5Falt->index : -1);
> +		break;
> +	}
>  	}
>  }
> =20
> @@ -410,7 +466,13 @@ static void visl=5Ftrace=5Fctrls(struct visl=5Fc=
tx *ctx, struct visl=5Frun *run)
>  			trace=5Fv4l2=5Fhevc=5Fdpb=5Fentry(&run->hevc.dpram->dpb[i]);
> =20
>  		trace=5Fv4l2=5Fhevc=5Fpred=5Fweight=5Ftable(&run->hevc.spram->pred=
=5Fweight=5Ftable);
> -	break;
> +		break;
> +	case VISL=5FCODEC=5FAV1:
> +		trace=5Fv4l2=5Fctrl=5Fav1=5Fsequence(run->av1.seq);
> +		trace=5Fv4l2=5Fctrl=5Fav1=5Fframe(run->av1.frame);
> +		trace=5Fv4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain(run->av1.grain);
> +		trace=5Fv4l2=5Fctrl=5Fav1=5Ftile=5Fgroup=5Fentry(run->av1.tge);
> +		break;
>  	}
>  }
> =20
> @@ -469,6 +531,12 @@ void visl=5Fdevice=5Frun(void *priv)
>  		run.hevc.sm =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5FSTA=
TELESS=5FHEVC=5FSCALING=5FMATRIX);
>  		run.hevc.dpram =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5F=
STATELESS=5FHEVC=5FDECODE=5FPARAMS);
>  		break;
> +	case VISL=5FCODEC=5FAV1:
> +		run.av1.seq =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5FSTA=
TELESS=5FAV1=5FSEQUENCE);
> +		run.av1.frame =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5FS=
TATELESS=5FAV1=5FFRAME);
> +		run.av1.tge =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5FSTA=
TELESS=5FAV1=5FTILE=5FGROUP=5FENTRY);
> +		run.av1.grain =3D visl=5Ffind=5Fcontrol=5Fdata(ctx, V4L2=5FCID=5FS=
TATELESS=5FAV1=5FFILM=5FGRAIN);
> +		break;
>  	}
> =20
>  	frame=5Fdprintk(ctx->dev, run.dst->sequence,
> diff --git a/drivers/media/test-drivers/visl/visl-dec.h b/drivers/med=
ia/test-drivers/visl/visl-dec.h
> index 4a706a9de02e..c2c2ef3a8798 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.h
> +++ b/drivers/media/test-drivers/visl/visl-dec.h
> @@ -45,6 +45,13 @@ struct visl=5Fhevc=5Frun {
>  	const struct v4l2=5Fctrl=5Fhevc=5Fdecode=5Fparams *dpram;
>  };
> =20
> +struct visl=5Fav1=5Frun {
> +	const struct v4l2=5Fctrl=5Fav1=5Fsequence *seq;
> +	const struct v4l2=5Fctrl=5Fav1=5Fframe *frame;
> +	const struct v4l2=5Fctrl=5Fav1=5Ftile=5Fgroup=5Fentry *tge;
> +	const struct v4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain *grain;
> +};
> +
>  struct visl=5Frun {
>  	struct vb2=5Fv4l2=5Fbuffer	*src;
>  	struct vb2=5Fv4l2=5Fbuffer	*dst;
> @@ -56,6 +63,7 @@ struct visl=5Frun {
>  		struct visl=5Fvp9=5Frun	vp9;
>  		struct visl=5Fh264=5Frun	h264;
>  		struct visl=5Fhevc=5Frun	hevc;
> +		struct visl=5Fav1=5Frun	av1;
>  	};
>  };
> =20
> diff --git a/drivers/media/test-drivers/visl/visl-trace-av1.h b/drive=
rs/media/test-drivers/visl/visl-trace-av1.h
> new file mode 100644
> index 000000000000..09f205de53df
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-av1.h
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(=5FVISL=5FTRACE=5FAV1=5FH=5F) || defined(TRACE=5FHEADER=
=5FMULTI=5FREAD)
> +#define =5FVISL=5FTRACE=5FAV1=5FH=5F
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE=5FSYSTEM
> +#define TRACE=5FSYSTEM visl=5Fav1=5Fcontrols
> +
> +DECLARE=5FEVENT=5FCLASS(v4l2=5Fctrl=5Fav1=5Fseq=5Ftmpl,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Fsequence *s),
> +	TP=5FARGS(s),
> +	TP=5FSTRUCT=5F=5Fentry(=5F=5Ffield=5Fstruct(struct v4l2=5Fctrl=5Fav=
1=5Fsequence, s)),
> +	TP=5Ffast=5Fassign(=5F=5Fentry->s =3D *s;),
> +	TP=5Fprintk("\nflags %s\nseq=5Fprofile: %u\norder=5Fhint=5Fbits: %u=
\nbit=5Fdepth: %u\n"
> +		  "max=5Fframe=5Fwidth=5Fminus=5F1: %u\nmax=5Fframe=5Fheight=5Fmin=
us=5F1: %u\n",
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->s.flags, "|",
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FSTILL=5FPICTURE, "STILL=5FPICTUR=
E"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FUSE=5F128X128=5FSUPERBLOCK, "USE=
=5F128X128=5FSUPERBLOCK"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FFILTER=5FINTRA, "ENABLE=
=5FFILTER=5FINTRA"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FINTRA=5FEDGE=5FFILTER, =
"ENABLE=5FINTRA=5FEDGE=5FFILTER"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FINTERINTRA=5FCOMPOUND, =
"ENABLE=5FINTERINTRA=5FCOMPOUND"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FMASKED=5FCOMPOUND, "ENA=
BLE=5FMASKED=5FCOMPOUND"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FWARPED=5FMOTION, "ENABL=
E=5FWARPED=5FMOTION"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FDUAL=5FFILTER, "ENABLE=5F=
DUAL=5FFILTER"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FORDER=5FHINT, "ENABLE=5F=
ORDER=5FHINT"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FJNT=5FCOMP, "ENABLE=5FJ=
NT=5FCOMP"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FREF=5FFRAME=5FMVS, "ENA=
BLE=5FREF=5FFRAME=5FMVS"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FSUPERRES, "ENABLE=5FSUP=
ERRES"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FCDEF, "ENABLE=5FCDEF"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FENABLE=5FRESTORATION, "ENABLE=5F=
RESTORATION"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FMONO=5FCHROME, "MONO=5FCHROME"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FCOLOR=5FRANGE, "COLOR=5FRANGE"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FSUBSAMPLING=5FX, "SUBSAMPLING=5F=
X"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FSUBSAMPLING=5FY, "SUBSAMPLING=5F=
Y"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FFILM=5FGRAIN=5FPARAMS=5FPRESENT,=
 "FILM=5FGRAIN=5FPARAMS=5FPRESENT"},
> +		  {V4L2=5FAV1=5FSEQUENCE=5FFLAG=5FSEPARATE=5FUV=5FDELTA=5FQ, "SEPA=
RATE=5FUV=5FDELTA=5FQ"}),
> +		  =5F=5Fentry->s.seq=5Fprofile,
> +		  =5F=5Fentry->s.order=5Fhint=5Fbits,
> +		  =5F=5Fentry->s.bit=5Fdepth,
> +		  =5F=5Fentry->s.max=5Fframe=5Fwidth=5Fminus=5F1,
> +		  =5F=5Fentry->s.max=5Fframe=5Fheight=5Fminus=5F1
> +	)
> +);
> +
> +DECLARE=5FEVENT=5FCLASS(v4l2=5Fctrl=5Fav1=5Ftge=5Ftmpl,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Ftile=5Fgroup=5Fentry *t=
),
> +	TP=5FARGS(t),
> +	TP=5FSTRUCT=5F=5Fentry(=5F=5Ffield=5Fstruct(struct v4l2=5Fctrl=5Fav=
1=5Ftile=5Fgroup=5Fentry, t)),
> +	TP=5Ffast=5Fassign(=5F=5Fentry->t =3D *t;),
> +	TP=5Fprintk("\ntile=5Foffset: %u\n tile=5Fsize: %u\n tile=5Frow: %u=
\ntile=5Fcol: %u\n",
> +		  =5F=5Fentry->t.tile=5Foffset,
> +		  =5F=5Fentry->t.tile=5Fsize,
> +		  =5F=5Fentry->t.tile=5Frow,
> +		  =5F=5Fentry->t.tile=5Fcol
> +	)
> +);
> +
> +DECLARE=5FEVENT=5FCLASS(v4l2=5Fctrl=5Fav1=5Fframe=5Ftmpl,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Fframe *f),
> +	TP=5FARGS(f),
> +	TP=5FSTRUCT=5F=5Fentry(=5F=5Ffield=5Fstruct(struct v4l2=5Fctrl=5Fav=
1=5Fframe, f)),
> +	TP=5Ffast=5Fassign(=5F=5Fentry->f =3D *f;),
> +	TP=5Fprintk("\ntile=5Finfo.flags: %s\ntile=5Finfo.context=5Fupdate=5F=
tile=5Fid: %u\n"
> +		  "tile=5Finfo.tile=5Fcols: %u\ntile=5Finfo.tile=5Frows: %u\n"
> +		  "tile=5Finfo.mi=5Fcol=5Fstarts: %s\ntile=5Finfo.mi=5Frow=5Fstart=
s: %s\n"
> +		  "tile=5Finfo.width=5Fin=5Fsbs=5Fminus=5F1: %s\ntile=5Finfo.heigh=
t=5Fin=5Fsbs=5Fminus=5F1: %s\n"
> +		  "tile=5Finfo.tile=5Fsize=5Fbytes: %u\nquantization.flags: %s\n"
> +		  "quantization.base=5Fq=5Fidx: %u\nquantization.delta=5Fq=5Fy=5Fd=
c: %d\n"
> +		  "quantization.delta=5Fq=5Fu=5Fdc: %d\nquantization.delta=5Fq=5Fu=
=5Fac: %d\n"
> +		  "quantization.delta=5Fq=5Fv=5Fdc: %d\nquantization.delta=5Fq=5Fv=
=5Fac: %d\n"
> +		  "quantization.qm=5Fy: %u\nquantization.qm=5Fu: %u\nquantization.=
qm=5Fv: %u\n"
> +		  "quantization.delta=5Fq=5Fres: %u\nsuperres=5Fdenom: %u\nsegment=
ation.flags: %s\n"
> +		  "segmentation.last=5Factive=5Fseg=5Fid: %u\nsegmentation.feature=
=5Fenabled:%s\n"
> +		  "loop=5Ffilter.flags: %s\nloop=5Ffilter.level: %s\nloop=5Ffilter=
.sharpness: %u\n"
> +		  "loop=5Ffilter.ref=5Fdeltas: %s\nloop=5Ffilter.mode=5Fdeltas: %s=
\n"
> +		  "loop=5Ffilter.delta=5Flf=5Fres: %u\ncdef.damping=5Fminus=5F3: %=
u\ncdef.bits: %u\n"
> +		  "cdef.y=5Fpri=5Fstrength: %s\ncdef.y=5Fsec=5Fstrength: %s\n"
> +		  "cdef.uv=5Fpri=5Fstrength: %s\ncdef.uv=5Fsec=5Fstrength:%s\nskip=
=5Fmode=5Fframe: %s\n"
> +		  "primary=5Fref=5Fframe: %u\nloop=5Frestoration.flags: %s\n"
> +		  "loop=5Frestoration.lr=5Funit=5Fshift: %u\nloop=5Frestoration.lr=
=5Fuv=5Fshift: %u\n"
> +		  "loop=5Frestoration.frame=5Frestoration=5Ftype: %s\n"
> +		  "loop=5Frestoration.loop=5Frestoration=5Fsize: %s\nflags: %s\nor=
der=5Fhint: %u\n"
> +		  "upscaled=5Fwidth: %u\nframe=5Fwidth=5Fminus=5F1: %u\nframe=5Fhe=
ight=5Fminus=5F1: %u\n"
> +		  "render=5Fwidth=5Fminus=5F1: %u\nrender=5Fheight=5Fminus=5F1: %u=
\ncurrent=5Fframe=5Fid: %u\n"
> +		  "buffer=5Fremoval=5Ftime: %s\norder=5Fhints: %s\nreference=5Ffra=
me=5Fts: %s\n"
> +		  "ref=5Fframe=5Fidx: %s\nrefresh=5Fframe=5Fflags: %u\n",
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.tile=5Finfo.flags, "|",
> +		  {V4L2=5FAV1=5FTILE=5FINFO=5FFLAG=5FUNIFORM=5FTILE=5FSPACING, "UN=
IFORM=5FTILE=5FSPACING"}),
> +		  =5F=5Fentry->f.tile=5Finfo.context=5Fupdate=5Ftile=5Fid,
> +		  =5F=5Fentry->f.tile=5Finfo.tile=5Fcols,
> +		  =5F=5Fentry->f.tile=5Finfo.tile=5Frows,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.tile=5Finfo.mi=5Fcol=5Fstarts=
,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.tile=5Finfo.mi=5Fcol=5Fstarts),
> +				sizeof(=5F=5Fentry->f.tile=5Finfo.mi=5Fcol=5Fstarts[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.tile=5Finfo.mi=5Frow=5Fstarts=
,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.tile=5Finfo.mi=5Frow=5Fstarts),
> +				sizeof(=5F=5Fentry->f.tile=5Finfo.mi=5Frow=5Fstarts[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.tile=5Finfo.width=5Fin=5Fsbs=5F=
minus=5F1,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.tile=5Finfo.width=5Fin=5Fsbs=5Fminus=
=5F1),
> +				sizeof(=5F=5Fentry->f.tile=5Finfo.width=5Fin=5Fsbs=5Fminus=5F1[0=
])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.tile=5Finfo.height=5Fin=5Fsbs=
=5Fminus=5F1,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.tile=5Finfo.height=5Fin=5Fsbs=5Fminu=
s=5F1),
> +				sizeof(=5F=5Fentry->f.tile=5Finfo.height=5Fin=5Fsbs=5Fminus=5F1[=
0])),
> +		  =5F=5Fentry->f.tile=5Finfo.tile=5Fsize=5Fbytes,
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.quantization.flags, "|",
> +		  {V4L2=5FAV1=5FQUANTIZATION=5FFLAG=5FDIFF=5FUV=5FDELTA, "DIFF=5FU=
V=5FDELTA"},
> +		  {V4L2=5FAV1=5FQUANTIZATION=5FFLAG=5FUSING=5FQMATRIX, "USING=5FQM=
ATRIX"},
> +		  {V4L2=5FAV1=5FQUANTIZATION=5FFLAG=5FDELTA=5FQ=5FPRESENT, "DELTA=5F=
Q=5FPRESENT"}),
> +		  =5F=5Fentry->f.quantization.base=5Fq=5Fidx,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fy=5Fdc,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fu=5Fdc,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fu=5Fac,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fv=5Fdc,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fv=5Fac,
> +		  =5F=5Fentry->f.quantization.qm=5Fy,
> +		  =5F=5Fentry->f.quantization.qm=5Fu,
> +		  =5F=5Fentry->f.quantization.qm=5Fv,
> +		  =5F=5Fentry->f.quantization.delta=5Fq=5Fres,
> +		  =5F=5Fentry->f.superres=5Fdenom,
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.segmentation.flags, "|",
> +		  {V4L2=5FAV1=5FSEGMENTATION=5FFLAG=5FENABLED, "ENABLED"},
> +		  {V4L2=5FAV1=5FSEGMENTATION=5FFLAG=5FUPDATE=5FMAP, "UPDATE=5FMAP"=
},
> +		  {V4L2=5FAV1=5FSEGMENTATION=5FFLAG=5FTEMPORAL=5FUPDATE, "TEMPORAL=
=5FUPDATE"},
> +		  {V4L2=5FAV1=5FSEGMENTATION=5FFLAG=5FUPDATE=5FDATA, "UPDATE=5FDAT=
A"},
> +		  {V4L2=5FAV1=5FSEGMENTATION=5FFLAG=5FSEG=5FID=5FPRE=5FSKIP, "SEG=5F=
ID=5FPRE=5FSKIP"}),
> +		  =5F=5Fentry->f.segmentation.last=5Factive=5Fseg=5Fid,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.segmentation.feature=5Fenable=
d,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.segmentation.feature=5Fenabled),
> +				sizeof(=5F=5Fentry->f.segmentation.feature=5Fenabled[0])),
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.loop=5Ffilter.flags, "|",
> +		  {V4L2=5FAV1=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FENABLED, "DELTA=5FE=
NABLED"},
> +		  {V4L2=5FAV1=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FUPDATE, "DELTA=5FUP=
DATE"},
> +		  {V4L2=5FAV1=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FLF=5FPRESENT, "DELT=
A=5FLF=5FPRESENT"},
> +		  {V4L2=5FAV1=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FLF=5FMULTI, "DELTA=5F=
LF=5FMULTI"}),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.loop=5Ffilter.level,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.loop=5Ffilter.level),
> +				sizeof(=5F=5Fentry->f.loop=5Ffilter.level[0])),
> +		  =5F=5Fentry->f.loop=5Ffilter.sharpness,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.loop=5Ffilter.ref=5Fdeltas,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.loop=5Ffilter.ref=5Fdeltas),
> +				sizeof(=5F=5Fentry->f.loop=5Ffilter.ref=5Fdeltas[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.loop=5Ffilter.mode=5Fdeltas,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.loop=5Ffilter.mode=5Fdeltas),
> +				sizeof(=5F=5Fentry->f.loop=5Ffilter.mode=5Fdeltas[0])),
> +		  =5F=5Fentry->f.loop=5Ffilter.delta=5Flf=5Fres,
> +		  =5F=5Fentry->f.cdef.damping=5Fminus=5F3,
> +		  =5F=5Fentry->f.cdef.bits,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.cdef.y=5Fpri=5Fstrength,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.cdef.y=5Fpri=5Fstrength),
> +				sizeof(=5F=5Fentry->f.cdef.y=5Fpri=5Fstrength[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.cdef.y=5Fsec=5Fstrength,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.cdef.y=5Fsec=5Fstrength),
> +				sizeof(=5F=5Fentry->f.cdef.y=5Fsec=5Fstrength[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.cdef.uv=5Fpri=5Fstrength,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.cdef.uv=5Fpri=5Fstrength),
> +				sizeof(=5F=5Fentry->f.cdef.uv=5Fpri=5Fstrength[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.cdef.uv=5Fsec=5Fstrength,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.cdef.uv=5Fsec=5Fstrength),
> +				sizeof(=5F=5Fentry->f.cdef.uv=5Fsec=5Fstrength[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.skip=5Fmode=5Fframe,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.skip=5Fmode=5Fframe),
> +				sizeof(=5F=5Fentry->f.skip=5Fmode=5Fframe[0])),
> +		  =5F=5Fentry->f.primary=5Fref=5Fframe,
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.loop=5Frestoration.flags, "|"=
,
> +		  {V4L2=5FAV1=5FLOOP=5FRESTORATION=5FFLAG=5FUSES=5FLR, "USES=5FLR"=
},
> +		  {V4L2=5FAV1=5FLOOP=5FRESTORATION=5FFLAG=5FUSES=5FCHROMA=5FLR, "U=
SES=5FCHROMA=5FLR"}),
> +		  =5F=5Fentry->f.loop=5Frestoration.lr=5Funit=5Fshift,
> +		  =5F=5Fentry->f.loop=5Frestoration.lr=5Fuv=5Fshift,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.loop=5Frestoration.frame=5Fre=
storation=5Ftype,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.loop=5Frestoration.frame=5Frestorati=
on=5Ftype),
> +				sizeof(=5F=5Fentry->f.loop=5Frestoration.frame=5Frestoration=5Ft=
ype[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.loop=5Frestoration.loop=5Fres=
toration=5Fsize,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.loop=5Frestoration.loop=5Frestoratio=
n=5Fsize),
> +				sizeof(=5F=5Fentry->f.loop=5Frestoration.loop=5Frestoration=5Fsi=
ze[0])),
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.flags, "|",
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FSHOW=5FFRAME, "SHOW=5FFRAME"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FSHOWABLE=5FFRAME, "SHOWABLE=5FFRAME=
"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FERROR=5FRESILIENT=5FMODE, "ERROR=5F=
RESILIENT=5FMODE"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FDISABLE=5FCDF=5FUPDATE, "DISABLE=5F=
CDF=5FUPDATE"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FALLOW=5FSCREEN=5FCONTENT=5FTOOLS, "=
ALLOW=5FSCREEN=5FCONTENT=5FTOOLS"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FFORCE=5FINTEGER=5FMV, "FORCE=5FINTE=
GER=5FMV"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FALLOW=5FINTRABC, "ALLOW=5FINTRABC"}=
,
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FUSE=5FSUPERRES, "USE=5FSUPERRES"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FALLOW=5FHIGH=5FPRECISION=5FMV, "ALL=
OW=5FHIGH=5FPRECISION=5FMV"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FIS=5FMOTION=5FMODE=5FSWITCHABLE, "I=
S=5FMOTION=5FMODE=5FSWITCHABLE"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FUSE=5FREF=5FFRAME=5FMVS, "USE=5FREF=
=5FFRAME=5FMVS"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FDISABLE=5FFRAME=5FEND=5FUPDATE=5FCD=
F,
> +		   "DISABLE=5FFRAME=5FEND=5FUPDATE=5FCDF"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FALLOW=5FWARPED=5FMOTION, "ALLOW=5FW=
ARPED=5FMOTION"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FREFERENCE=5FSELECT, "REFERENCE=5FSE=
LECT"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FREDUCED=5FTX=5FSET, "REDUCED=5FTX=5F=
SET"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FSKIP=5FMODE=5FALLOWED, "SKIP=5FMODE=
=5FALLOWED"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FSKIP=5FMODE=5FPRESENT, "SKIP=5FMODE=
=5FPRESENT"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FFRAME=5FSIZE=5FOVERRIDE, "FRAME=5FS=
IZE=5FOVERRIDE"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FBUFFER=5FREMOVAL=5FTIME=5FPRESENT, =
"BUFFER=5FREMOVAL=5FTIME=5FPRESENT"},
> +		  {V4L2=5FAV1=5FFRAME=5FFLAG=5FFRAME=5FREFS=5FSHORT=5FSIGNALING, "=
FRAME=5FREFS=5FSHORT=5FSIGNALING"}),
> +		  =5F=5Fentry->f.order=5Fhint,
> +		  =5F=5Fentry->f.upscaled=5Fwidth,
> +		  =5F=5Fentry->f.frame=5Fwidth=5Fminus=5F1,
> +		  =5F=5Fentry->f.frame=5Fheight=5Fminus=5F1,
> +		  =5F=5Fentry->f.render=5Fwidth=5Fminus=5F1,
> +		  =5F=5Fentry->f.render=5Fheight=5Fminus=5F1,
> +		  =5F=5Fentry->f.current=5Fframe=5Fid,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.buffer=5Fremoval=5Ftime,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.buffer=5Fremoval=5Ftime),
> +				sizeof(=5F=5Fentry->f.buffer=5Fremoval=5Ftime[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.order=5Fhints,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.order=5Fhints),
> +				sizeof(=5F=5Fentry->f.order=5Fhints[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.reference=5Fframe=5Fts,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.reference=5Fframe=5Fts),
> +				sizeof(=5F=5Fentry->f.reference=5Fframe=5Fts[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.ref=5Fframe=5Fidx,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.ref=5Fframe=5Fidx),
> +				sizeof(=5F=5Fentry->f.ref=5Fframe=5Fidx[0])),
> +		  =5F=5Fentry->f.refresh=5Fframe=5Fflags
> +	)
> +);
> +
> +
> +DECLARE=5FEVENT=5FCLASS(v4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain=5Ftmpl,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain *f),
> +	TP=5FARGS(f),
> +	TP=5FSTRUCT=5F=5Fentry(=5F=5Ffield=5Fstruct(struct v4l2=5Fctrl=5Fav=
1=5Ffilm=5Fgrain, f)),
> +	TP=5Ffast=5Fassign(=5F=5Fentry->f =3D *f;),
> +	TP=5Fprintk("\nflags %s\ncr=5Fmult: %u\ngrain=5Fseed: %u\n"
> +		  "film=5Fgrain=5Fparams=5Fref=5Fidx: %u\nnum=5Fy=5Fpoints: %u\npo=
int=5Fy=5Fvalue: %s\n"
> +		  "point=5Fy=5Fscaling: %s\nnum=5Fcb=5Fpoints: %u\npoint=5Fcb=5Fva=
lue: %s\n"
> +		  "point=5Fcb=5Fscaling: %s\nnum=5Fcr=5Fpoints: %u\npoint=5Fcr=5Fv=
alue: %s\n"
> +		  "point=5Fcr=5Fscaling: %s\ngrain=5Fscaling=5Fminus=5F8: %u\nar=5F=
coeff=5Flag: %u\n"
> +		  "ar=5Fcoeffs=5Fy=5Fplus=5F128: %s\nar=5Fcoeffs=5Fcb=5Fplus=5F128=
: %s\n"
> +		  "ar=5Fcoeffs=5Fcr=5Fplus=5F128: %s\nar=5Fcoeff=5Fshift=5Fminus=5F=
6: %u\n"
> +		  "grain=5Fscale=5Fshift: %u\ncb=5Fmult: %u\ncb=5Fluma=5Fmult: %u\=
ncr=5Fluma=5Fmult: %u\n"
> +		  "cb=5Foffset: %u\ncr=5Foffset: %u\n",
> +		  =5F=5Fprint=5Fflags(=5F=5Fentry->f.flags, "|",
> +		  {V4L2=5FAV1=5FFILM=5FGRAIN=5FFLAG=5FAPPLY=5FGRAIN, "APPLY=5FGRAI=
N"},
> +		  {V4L2=5FAV1=5FFILM=5FGRAIN=5FFLAG=5FUPDATE=5FGRAIN, "UPDATE=5FGR=
AIN"},
> +		  {V4L2=5FAV1=5FFILM=5FGRAIN=5FFLAG=5FCHROMA=5FSCALING=5FFROM=5FLU=
MA, "CHROMA=5FSCALING=5FFROM=5FLUMA"},
> +		  {V4L2=5FAV1=5FFILM=5FGRAIN=5FFLAG=5FOVERLAP, "OVERLAP"},
> +		  {V4L2=5FAV1=5FFILM=5FGRAIN=5FFLAG=5FCLIP=5FTO=5FRESTRICTED=5FRAN=
GE, "CLIP=5FTO=5FRESTRICTED=5FRANGE"}),
> +		  =5F=5Fentry->f.cr=5Fmult,
> +		  =5F=5Fentry->f.grain=5Fseed,
> +		  =5F=5Fentry->f.film=5Fgrain=5Fparams=5Fref=5Fidx,
> +		  =5F=5Fentry->f.num=5Fy=5Fpoints,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fy=5Fvalue,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fy=5Fvalue),
> +				sizeof(=5F=5Fentry->f.point=5Fy=5Fvalue[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fy=5Fscaling,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fy=5Fscaling),
> +				sizeof(=5F=5Fentry->f.point=5Fy=5Fscaling[0])),
> +		  =5F=5Fentry->f.num=5Fcb=5Fpoints,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fcb=5Fvalue,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fcb=5Fvalue),
> +				sizeof(=5F=5Fentry->f.point=5Fcb=5Fvalue[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fcb=5Fscaling,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fcb=5Fscaling),
> +				sizeof(=5F=5Fentry->f.point=5Fcb=5Fscaling[0])),
> +		  =5F=5Fentry->f.num=5Fcr=5Fpoints,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fcr=5Fvalue,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fcr=5Fvalue),
> +				sizeof(=5F=5Fentry->f.point=5Fcr=5Fvalue[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.point=5Fcr=5Fscaling,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.point=5Fcr=5Fscaling),
> +				sizeof(=5F=5Fentry->f.point=5Fcr=5Fscaling[0])),
> +		  =5F=5Fentry->f.grain=5Fscaling=5Fminus=5F8,
> +		  =5F=5Fentry->f.ar=5Fcoeff=5Flag,
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.ar=5Fcoeffs=5Fy=5Fplus=5F128,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.ar=5Fcoeffs=5Fy=5Fplus=5F128),
> +				sizeof(=5F=5Fentry->f.ar=5Fcoeffs=5Fy=5Fplus=5F128[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.ar=5Fcoeffs=5Fcb=5Fplus=5F128=
,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.ar=5Fcoeffs=5Fcb=5Fplus=5F128),
> +				sizeof(=5F=5Fentry->f.ar=5Fcoeffs=5Fcb=5Fplus=5F128[0])),
> +		  =5F=5Fprint=5Farray(=5F=5Fentry->f.ar=5Fcoeffs=5Fcr=5Fplus=5F128=
,
> +				ARRAY=5FSIZE(=5F=5Fentry->f.ar=5Fcoeffs=5Fcr=5Fplus=5F128),
> +				sizeof(=5F=5Fentry->f.ar=5Fcoeffs=5Fcr=5Fplus=5F128[0])),
> +		  =5F=5Fentry->f.ar=5Fcoeff=5Fshift=5Fminus=5F6,
> +		  =5F=5Fentry->f.grain=5Fscale=5Fshift,
> +		  =5F=5Fentry->f.cb=5Fmult,
> +		  =5F=5Fentry->f.cb=5Fluma=5Fmult,
> +		  =5F=5Fentry->f.cr=5Fluma=5Fmult,
> +		  =5F=5Fentry->f.cb=5Foffset,
> +		  =5F=5Fentry->f.cr=5Foffset
> +	)
> +)
> +
> +DEFINE=5FEVENT(v4l2=5Fctrl=5Fav1=5Fseq=5Ftmpl, v4l2=5Fctrl=5Fav1=5Fs=
equence,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Fsequence *s),
> +	TP=5FARGS(s)
> +);
> +
> +DEFINE=5FEVENT(v4l2=5Fctrl=5Fav1=5Fframe=5Ftmpl, v4l2=5Fctrl=5Fav1=5F=
frame,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Fframe *f),
> +	TP=5FARGS(f)
> +);
> +
> +DEFINE=5FEVENT(v4l2=5Fctrl=5Fav1=5Ftge=5Ftmpl, v4l2=5Fctrl=5Fav1=5Ft=
ile=5Fgroup=5Fentry,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Ftile=5Fgroup=5Fentry *t=
),
> +	TP=5FARGS(t)
> +);
> +
> +DEFINE=5FEVENT(v4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain=5Ftmpl, v4l2=5Fctrl=5F=
av1=5Ffilm=5Fgrain,
> +	TP=5FPROTO(const struct v4l2=5Fctrl=5Fav1=5Ffilm=5Fgrain *f),
> +	TP=5FARGS(f)
> +);
> +
> +#endif
> +
> +#undef TRACE=5FINCLUDE=5FPATH
> +#undef TRACE=5FINCLUDE=5FFILE
> +#define TRACE=5FINCLUDE=5FPATH ../../drivers/media/test-drivers/visl
> +#define TRACE=5FINCLUDE=5FFILE visl-trace-av1
> +#include <trace/define=5Ftrace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-points.c b/dr=
ivers/media/test-drivers/visl/visl-trace-points.c
> index f7b866534f1e..321ff732c682 100644
> --- a/drivers/media/test-drivers/visl/visl-trace-points.c
> +++ b/drivers/media/test-drivers/visl/visl-trace-points.c
> @@ -8,3 +8,4 @@
>  #include "visl-trace-vp9.h"
>  #include "visl-trace-h264.h"
>  #include "visl-trace-hevc.h"
> +#include "visl-trace-av1.h"
> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/m=
edia/test-drivers/visl/visl-video.c
> index 7cac6a6456eb..82d9c259e878 100644
> --- a/drivers/media/test-drivers/visl/visl-video.c
> +++ b/drivers/media/test-drivers/visl/visl-video.c
> @@ -40,6 +40,9 @@ static void visl=5Fset=5Fcurrent=5Fcodec(struct vis=
l=5Fctx *ctx)
>  	case V4L2=5FPIX=5FFMT=5FHEVC=5FSLICE:
>  		ctx->current=5Fcodec =3D VISL=5FCODEC=5FHEVC;
>  		break;
> +	case V4L2=5FPIX=5FFMT=5FAV1=5FFRAME:
> +		ctx->current=5Fcodec =3D VISL=5FCODEC=5FAV1;
> +		break;
>  	default:
>  		dprintk(ctx->dev, "Warning: unsupported fourcc: %d\n", fourcc);
>  		ctx->current=5Fcodec =3D VISL=5FCODEC=5FNONE;
> @@ -218,6 +221,21 @@ const struct visl=5Fcoded=5Fformat=5Fdesc visl=5F=
coded=5Ffmts[] =3D {
>  		.num=5Fdecoded=5Ffmts =3D ARRAY=5FSIZE(visl=5Fdecoded=5Ffmts),
>  		.decoded=5Ffmts =3D visl=5Fdecoded=5Ffmts,
>  	},
> +	{
> +		.pixelformat =3D V4L2=5FPIX=5FFMT=5FAV1=5FFRAME,
> +		.frmsize =3D {
> +			.min=5Fwidth =3D 64,
> +			.max=5Fwidth =3D 4096,
> +			.step=5Fwidth =3D 1,
> +			.min=5Fheight =3D 64,
> +			.max=5Fheight =3D 2304,
> +			.step=5Fheight =3D 1,
> +		},
> +		.ctrls =3D &visl=5Fav1=5Fctrls,
> +		.num=5Fdecoded=5Ffmts =3D ARRAY=5FSIZE(visl=5Fdecoded=5Ffmts),
> +		.decoded=5Ffmts =3D visl=5Fdecoded=5Ffmts,
> +	},
> +
>  };
> =20
>  const size=5Ft num=5Fcoded=5Ffmts =3D ARRAY=5FSIZE(visl=5Fcoded=5Ffm=
ts);
> diff --git a/drivers/media/test-drivers/visl/visl-video.h b/drivers/m=
edia/test-drivers/visl/visl-video.h
> index 27ad70a558db..92e274894c20 100644
> --- a/drivers/media/test-drivers/visl/visl-video.h
> +++ b/drivers/media/test-drivers/visl/visl-video.h
> @@ -17,6 +17,7 @@ extern const struct visl=5Fctrls visl=5Fvp8=5Fctrls=
;
>  extern const struct visl=5Fctrls visl=5Fvp9=5Fctrls;
>  extern const struct visl=5Fctrls visl=5Fh264=5Fctrls;
>  extern const struct visl=5Fctrls visl=5Fhevc=5Fctrls;
> +extern const struct visl=5Fctrls visl=5Fav1=5Fctrls;
> =20
>  int visl=5Fqueue=5Finit(void *priv, struct vb2=5Fqueue *src=5Fvq,
>  		    struct vb2=5Fqueue *dst=5Fvq);
> diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/t=
est-drivers/visl/visl.h
> index 31639f2e593d..c593b1337f11 100644
> --- a/drivers/media/test-drivers/visl/visl.h
> +++ b/drivers/media/test-drivers/visl/visl.h
> @@ -127,6 +127,7 @@ enum visl=5Fcodec {
>  	VISL=5FCODEC=5FVP9,
>  	VISL=5FCODEC=5FH264,
>  	VISL=5FCODEC=5FHEVC,
> +	VISL=5FCODEC=5FAV1,
>  };
> =20
>  struct visl=5Fblob {
> --=20
> 2.41.0
>=20

Nice work!

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>


