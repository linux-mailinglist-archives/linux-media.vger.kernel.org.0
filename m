Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA31565D7A
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 20:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbiGDSXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 14:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiGDSX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 14:23:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEE82AD1
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 11:23:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D18D802;
        Mon,  4 Jul 2022 20:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656959006;
        bh=fSE2iNZZ80HDoCZi65kCB8LPagED+jsTpXeq1+6qwKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmrZCQwzIm6BrswkM549lakeuFaMmzpXI2pJJKCVjiyMNQ9b2Vwp5EUm8ggBt0ejE
         NjvBtXbp+IS7wd5RmUoDzr4rB9ZWwzXZRCbe7FodgWgJ9hLqXsxt20F/ORzuAlAmng
         ThIbop7cTIqn8F4EBaD9eYtO3swqLEtygUvYEOMs=
Date:   Mon, 4 Jul 2022 21:23:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] v4l2 utils: Support V4L2_PIX_FMT_YUV[AX]32
Message-ID: <YsME1ejsZ2wqFZ/E@pendragon.ideasonboard.com>
References: <20220630092904.19053-1-laurent.pinchart@ideasonboard.com>
 <274c46e9-7d10-ad92-dec4-978b5a85b36e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <274c46e9-7d10-ad92-dec4-978b5a85b36e@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jul 04, 2022 at 01:08:04PM +0200, Hans Verkuil wrote:
> On 6/30/22 11:29, Laurent Pinchart wrote:
> > Add support for the V4L2_PIX_FMT_YUVA32 and V4L2_PIX_FMT_YUVX32 pixel
> > formats in the v4l2-ctl, v4l2-compliance, qvidcap and qv4l2 utilities.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch depends on the addition of the new YUVA32 and YUVX32 pixel
> > formats to the kernel, which I plan to post a pull request for in the
> > near future.
> > 
> > While working on this, I've noticed what could be a bug in the qv4l2 GL
> > shaders. It seems to me that at least the V4L2_PIX_FMT_VUYA32 and
> > V4L2_PIX_FMT_VUYX32 formats are not correctly handled. Hans, could you
> > have a look at this ?
> 
> It looks good to me. Do you actually see something wrong? I've tested with
> vivid and qv4l2, but you may be testing with another driver.

I haven't tested it, only read the code. Here's how the texture is
configured, first in CaptureWinGLEngine::shader_YUV_packed():

        case V4L2_PIX_FMT_AYUV32:
                hasAlpha = true;
                // fall-through
        case V4L2_PIX_FMT_YUV32:
        case V4L2_PIX_FMT_XYUV32:
                glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_frameWidth, m_frameHeight, 0,
                             GL_BGRA, GL_UNSIGNED_INT_8_8_8_8, NULL);
                break;
        case V4L2_PIX_FMT_VUYA32:
                hasAlpha = true;
                // fall-through
        case V4L2_PIX_FMT_VUYX32:
                glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_frameWidth, m_frameHeight, 0,
                             GL_RGBA, GL_UNSIGNED_INT_8_8_8_8, NULL);
                break;

And then in CaptureWinGLEngine::render_YUV_packed():

        case V4L2_PIX_FMT_YUV32:
        case V4L2_PIX_FMT_AYUV32:
        case V4L2_PIX_FMT_XYUV32:
                glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, m_frameWidth, m_frameHeight,
                                GL_BGRA, GL_UNSIGNED_INT_8_8_8_8, m_frameData);
                break;
        case V4L2_PIX_FMT_VUYA32:
        case V4L2_PIX_FMT_VUYX32:
                glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, m_frameWidth, m_frameHeight,
                                GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, m_frameData);
                break;

So, as far as I understand, for V4L2_PIX_FMT_VUYA32, the combination of
GL_BGRA and GL_UNSIGNED_INT_8_8_8_8_REV specify the components order in
memory as A, R, G, B (BGRA reversed). This thus map

V -> A
U -> R
Y -> G
A -> B

But he shader unconditionally maps the components as follows:

        codeHead += "   float y = color.r;"
                    "   float u = color.g - 0.5;"
                    "   float v = color.b - 0.5;";

What am I missing ?

> > ---
> >  utils/qv4l2/capture-win-gl.cpp             | 17 +++++++++++++++++
> >  utils/qv4l2/qv4l2.cpp                      |  2 ++
> >  utils/qvidcap/capture.cpp                  |  4 ++++
> >  utils/qvidcap/paint.cpp                    | 10 ++++++++++
> >  utils/qvidcap/v4l2-convert.glsl            |  6 ++++++
> >  utils/v4l2-compliance/v4l2-test-colors.cpp |  4 ++++
> >  utils/v4l2-ctl/v4l2-ctl.cpp                |  2 ++
> >  7 files changed, 45 insertions(+)
> > 
> > diff --git a/utils/qv4l2/capture-win-gl.cpp b/utils/qv4l2/capture-win-gl.cpp
> > index 05659259d42f..6cbeb426b6ba 100644
> > --- a/utils/qv4l2/capture-win-gl.cpp
> > +++ b/utils/qv4l2/capture-win-gl.cpp
> > @@ -196,6 +196,8 @@ void CaptureWinGLEngine::setColorspace(unsigned colorspace, unsigned xfer_func,
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  	case V4L2_PIX_FMT_HSV24:
> >  	case V4L2_PIX_FMT_HSV32:
> >  		is_rgb = false;
> > @@ -415,6 +417,8 @@ bool CaptureWinGLEngine::hasNativeFormat(__u32 format)
> >  		V4L2_PIX_FMT_XYUV32,
> >  		V4L2_PIX_FMT_VUYA32,
> >  		V4L2_PIX_FMT_VUYX32,
> > +		V4L2_PIX_FMT_YUVA32,
> > +		V4L2_PIX_FMT_YUVX32,
> >  		V4L2_PIX_FMT_GREY,
> >  		V4L2_PIX_FMT_Z16,
> >  		V4L2_PIX_FMT_INZI,
> > @@ -483,6 +487,8 @@ void CaptureWinGLEngine::changeShader()
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		shader_YUV_packed(m_frameFormat);
> >  		break;
> >  
> > @@ -651,6 +657,8 @@ void CaptureWinGLEngine::paintGL()
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		render_YUV_packed(m_frameFormat);
> >  		break;
> >  
> > @@ -2100,6 +2108,13 @@ void CaptureWinGLEngine::shader_YUV_packed(__u32 format)
> >  		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_frameWidth, m_frameHeight, 0,
> >  			     GL_RGBA, GL_UNSIGNED_INT_8_8_8_8, NULL);
> >  		break;
> > +	case V4L2_PIX_FMT_YUVA32:
> > +		hasAlpha = true;
> > +		// fall-through
> > +	case V4L2_PIX_FMT_YUVX32:
> > +		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_frameWidth, m_frameHeight, 0,
> > +			     GL_RGBA, GL_UNSIGNED_INT_8_8_8_8_REV, NULL);
> > +		break;
> >  	}
> >  
> >  	checkError("Packed YUV shader");
> > @@ -2173,6 +2188,8 @@ void CaptureWinGLEngine::render_YUV_packed(__u32 format)
> >  		break;
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, m_frameWidth, m_frameHeight,
> >  				GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, m_frameData);
> >  		break;
> > diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
> > index d9141ad1372d..4cbaa98e0ee0 100644
> > --- a/utils/qv4l2/qv4l2.cpp
> > +++ b/utils/qv4l2/qv4l2.cpp
> > @@ -1567,12 +1567,14 @@ void ApplicationWindow::capStart(bool start)
> >  	case V4L2_PIX_FMT_YUV32:
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		dstFmt = QImage::Format_RGB32;
> >  		break;
> >  	case V4L2_PIX_FMT_ARGB32:
> >  	case V4L2_PIX_FMT_ABGR32:
> >  	case V4L2_PIX_FMT_AYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> > +	case V4L2_PIX_FMT_YUVA32:
> >  		dstFmt = QImage::Format_ARGB32;
> >  		break;
> >  	case V4L2_PIX_FMT_INZI:
> > diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
> > index cfcbb89660e5..0b4c4115cf1b 100644
> > --- a/utils/qvidcap/capture.cpp
> > +++ b/utils/qvidcap/capture.cpp
> > @@ -57,6 +57,8 @@ const __u32 formats[] = {
> >  	V4L2_PIX_FMT_XYUV32,
> >  	V4L2_PIX_FMT_VUYA32,
> >  	V4L2_PIX_FMT_VUYX32,
> > +	V4L2_PIX_FMT_YUVA32,
> > +	V4L2_PIX_FMT_YUVX32,
> >  	V4L2_PIX_FMT_RGB32,
> >  	V4L2_PIX_FMT_XRGB32,
> >  	V4L2_PIX_FMT_ARGB32,
> > @@ -882,6 +884,8 @@ bool CaptureWin::updateV4LFormat(const cv4l_fmt &fmt)
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		m_is_rgb = false;
> >  		m_accepts_srgb = false;
> >  		break;
> > diff --git a/utils/qvidcap/paint.cpp b/utils/qvidcap/paint.cpp
> > index 745e40031149..c5aadb09ffa4 100644
> > --- a/utils/qvidcap/paint.cpp
> > +++ b/utils/qvidcap/paint.cpp
> > @@ -159,6 +159,8 @@ void CaptureWin::paintGL()
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		render_YUV_packed(m_v4l_fmt.g_pixelformat());
> >  		break;
> >  
> > @@ -355,6 +357,8 @@ static const struct define defines[] = {
> >  	DEF(V4L2_PIX_FMT_XYUV32),
> >  	DEF(V4L2_PIX_FMT_VUYA32),
> >  	DEF(V4L2_PIX_FMT_VUYX32),
> > +	DEF(V4L2_PIX_FMT_YUVA32),
> > +	DEF(V4L2_PIX_FMT_YUVX32),
> >  	DEF(V4L2_PIX_FMT_RGB32),
> >  	DEF(V4L2_PIX_FMT_XRGB32),
> >  	DEF(V4L2_PIX_FMT_ARGB32),
> > @@ -595,6 +599,8 @@ void CaptureWin::changeShader()
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		shader_YUV_packed();
> >  		break;
> >  
> > @@ -945,6 +951,8 @@ void CaptureWin::shader_YUV_packed()
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_v4l_fmt.g_width(), m_v4l_fmt.g_height(), 0,
> >  			     GL_RGBA, GL_UNSIGNED_BYTE, NULL);
> >  		break;
> > @@ -1310,6 +1318,8 @@ void CaptureWin::render_YUV_packed(__u32 format)
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, m_v4l_fmt.g_width(), m_v4l_fmt.g_height(),
> >  				GL_RGBA, GL_UNSIGNED_BYTE, m_curData[0]);
> >  		break;
> > diff --git a/utils/qvidcap/v4l2-convert.glsl b/utils/qvidcap/v4l2-convert.glsl
> > index 458901c43838..8bd5694b3165 100644
> > --- a/utils/qvidcap/v4l2-convert.glsl
> > +++ b/utils/qvidcap/v4l2-convert.glsl
> > @@ -292,6 +292,12 @@ void main()
> >  	yuv.r = color.b;
> >  	yuv.g = color.g;
> >  	yuv.b = color.r;
> > +#elif PIXFMT == V4L2_PIX_FMT_YUVA32 || PIXFMT == V4L2_PIX_FMT_YUVX32
> > +	vec4 color = texture(tex, xy);
> > +#if PIXFMT == V4L2_PIX_FMT_YUVA32
> > +	alpha = color.a;
> > +#endif
> > +	yuv = color.rgb;
> >  #elif PIXFMT == V4L2_PIX_FMT_YUV565
> >  	yuv = texture(tex, xy).rgb;
> >  #elif PIXFMT == V4L2_PIX_FMT_YUV422P || PIXFMT == V4L2_PIX_FMT_YUV420 || PIXFMT == V4L2_PIX_FMT_YVU420 || \
> > diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
> > index 887b2fd418d7..87bf0cd7f3ab 100644
> > --- a/utils/v4l2-compliance/v4l2-test-colors.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
> > @@ -200,6 +200,8 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
> >  		break;
> >  	case V4L2_PIX_FMT_RGBX32:
> >  	case V4L2_PIX_FMT_RGBA32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  		v32 = p8[4 * x + 2] + (p8[4 * x + 1] << 8) +
> >  		      (p8[4 * x] << 16) + (p8[4 * x + 3] << 24);
> >  		break;
> > @@ -386,6 +388,8 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  	case V4L2_PIX_FMT_YUYV:
> >  	case V4L2_PIX_FMT_UYVY:
> >  	case V4L2_PIX_FMT_YVYU:
> > diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> > index 6bf0a1c7d201..577cf37ec901 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> > @@ -345,6 +345,8 @@ static bool is_rgb_or_hsv(__u32 pixelformat)
> >  	case V4L2_PIX_FMT_XYUV32:
> >  	case V4L2_PIX_FMT_VUYA32:
> >  	case V4L2_PIX_FMT_VUYX32:
> > +	case V4L2_PIX_FMT_YUVA32:
> > +	case V4L2_PIX_FMT_YUVX32:
> >  	case V4L2_PIX_FMT_YUV410:
> >  	case V4L2_PIX_FMT_YUV420:
> >  	case V4L2_PIX_FMT_HI240:

-- 
Regards,

Laurent Pinchart
