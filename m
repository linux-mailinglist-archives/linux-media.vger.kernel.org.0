Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC2A33C90
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 02:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfFDAvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 20:51:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:10730 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbfFDAvT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 20:51:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jun 2019 17:51:16 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Jun 2019 17:51:13 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hXxfU-00037h-Kb; Tue, 04 Jun 2019 08:51:12 +0800
Date:   Tue, 4 Jun 2019 08:50:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     kbuild-all@01.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 2/2] media: v4l2: Get rid of
 ->vidioc_enum_fmt_vid_{cap,out}_mplane
Message-ID: <201906040815.01rIRjAt%lkp@intel.com>
References: <20190603135850.7689-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20190603135850.7689-2-boris.brezillon@collabora.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boris,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on next-20190603]
[cannot apply to v5.2-rc3]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Boris-Brezillon/media-v4l2-Make-sure-all-drivers-set-_MPLANE-caps-in-vdev-device_caps/20190604-072816
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-x074-201922 (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5:0,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from drivers/media/v4l2-core/v4l2-ioctl.c:15:
   drivers/media/v4l2-core/v4l2-ioctl.c: In function 'v4l_enum_fmt':
   drivers/media/v4l2-core/v4l2-ioctl.c:1397:15: warning: comparison of constant '9' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
                  ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1396:61: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
          ~~~~                                                   
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1397:15: warning: comparison of constant '9' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
                  ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1396:61: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
          ~~~~                                                   
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1397:15: warning: comparison of constant '9' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
                  ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1396:61: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
          ~~~~                                                   
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:1396:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1412:15: warning: comparison of constant '10' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
                  ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:60: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
          ~~~~                                                  
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1412:15: warning: comparison of constant '10' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
                  ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:60: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
          ~~~~                                                  
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1412:15: warning: comparison of constant '10' with boolean expression is always false [-Wbool-compare]
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
                  ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:60: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
          p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
          ~~~~                                                  
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:1411:3: note: in expansion of macro 'if'
      if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
      ^~

vim +/if +1396 drivers/media/v4l2-core/v4l2-ioctl.c

  1381	
  1382	static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
  1383					struct file *file, void *fh, void *arg)
  1384	{
  1385		struct video_device *vdev = video_devdata(file);
  1386		struct v4l2_fmtdesc *p = arg;
  1387		int ret = check_fmt(file, p->type);
  1388	
  1389		if (ret)
  1390			return ret;
  1391		ret = -EINVAL;
  1392	
  1393		switch (p->type) {
  1394		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
  1395		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> 1396			if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
  1397			    p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
  1398				break;
  1399	
  1400			if (unlikely(!ops->vidioc_enum_fmt_vid_cap))
  1401				break;
  1402			ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
  1403			break;
  1404		case V4L2_BUF_TYPE_VIDEO_OVERLAY:
  1405			if (unlikely(!ops->vidioc_enum_fmt_vid_overlay))
  1406				break;
  1407			ret = ops->vidioc_enum_fmt_vid_overlay(file, fh, arg);
  1408			break;
  1409		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
  1410		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
  1411			if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
  1412			    p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
  1413				break;
  1414	
  1415			if (unlikely(!ops->vidioc_enum_fmt_vid_out))
  1416				break;
  1417			ret = ops->vidioc_enum_fmt_vid_out(file, fh, arg);
  1418			break;
  1419		case V4L2_BUF_TYPE_SDR_CAPTURE:
  1420			if (unlikely(!ops->vidioc_enum_fmt_sdr_cap))
  1421				break;
  1422			ret = ops->vidioc_enum_fmt_sdr_cap(file, fh, arg);
  1423			break;
  1424		case V4L2_BUF_TYPE_SDR_OUTPUT:
  1425			if (unlikely(!ops->vidioc_enum_fmt_sdr_out))
  1426				break;
  1427			ret = ops->vidioc_enum_fmt_sdr_out(file, fh, arg);
  1428			break;
  1429		case V4L2_BUF_TYPE_META_CAPTURE:
  1430			if (unlikely(!ops->vidioc_enum_fmt_meta_cap))
  1431				break;
  1432			ret = ops->vidioc_enum_fmt_meta_cap(file, fh, arg);
  1433			break;
  1434		case V4L2_BUF_TYPE_META_OUTPUT:
  1435			if (unlikely(!ops->vidioc_enum_fmt_meta_out))
  1436				break;
  1437			ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
  1438			break;
  1439		}
  1440		if (ret == 0)
  1441			v4l_fill_fmtdesc(p);
  1442		return ret;
  1443	}
  1444	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--8t9RHnE3ZwKMSgU+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICIO89VwAAy5jb25maWcAjFxbc9w2sn7Pr5hyXpLaSqKbFZ9zSg8gCHKQIQkaAEcavaBk
eexVRZa8umzif3+6AXIIcJrjbG3tatBNXBqN7q8bDf/4w48L9vry+OXm5e725v7+2+Lz9mH7
dPOy/bj4dHe//b9FrhaNsguRS/srMFd3D69//3Z3+u588fbXk1+Pfnm6PVmstk8P2/sFf3z4
dPf5Fb6+e3z44ccf4L8/QuOXr9DR0/8uPt/e/vL74qd8++Hu5mHx+6+n8PXxz+EPYOWqKWTp
OHfSuJLzi29DE/xwa6GNVM3F70enR0c73oo15Y50FHWxZMYxU7tSWTV21BMumW5czTaZcF0j
G2klq+S1yBPGXBqWVeIfMEv93l0qvRpbsk5WuZW1cOLK+l6M0nak26UWLHeyKRT8j7PM4Mde
XKUX//3iefvy+nWUSqbVSjRONc7UbTQ0zMeJZu2YLl0la2kvTk9Q6P0yVN1KGN0KYxd3z4uH
xxfsePi6UpxVg/TevKGaHetiAfqFOcMqG/Ev2Vq4ldCNqFx5LaPpxZQMKCc0qbquGU25up77
Qs0RzkZCOqedVOIJxVKZMuC0DtGvrg9/rQ6Tz4gdyUXBusq6pTK2YbW4ePPTw+PD9uc34/fm
krVkx2Zj1rLlJK1VRl65+n0nOkEMy7UyxtWiVnrjmLWML2OBdUZUMiM7Zh3YBaJHvydM82Xg
gLmBTlWDksOJWTy/fnj+9vyy/TIqeSkaoSX3B6rVKhORCYhIZqku09OXq5rJhmpzSyk0zmND
91Uzq0EyMDdQeqs0zaWFEXrNLB6IWuUiHalQmou8P9SyKUeqaZk2ApnofnORdWVhvKy3Dx8X
j58mohkNneIrozoYCAyS5ctcRcN4OccsObPsABmtRmTrIsoabBt8LFzFjHV8wytiD7xhW49b
OiH7/sRaNNYcJKJNYzmHgQ6z1bCLLP+jI/lqZVzX4pQH3bJ3X7ZPz5R6La9dC1+pXPJYuxuF
FJlXgtRwTyYpS1kuUTW8QLRJefrt3JtNdCa1EHVrYYCGHnlgWKuqayzTG+Kc9TyjZIaPuIJv
BpnwtvvN3jz/uXiB6SxuYGrPLzcvz4ub29vH14eXu4fPo5Ss5CsHHzjGfR+JQqPS+u1PiLsZ
ZybHg8sFWBPgsOSy0NsZy6yhlmNk3B/83JnE3h/npJj/wQK9IDTvFmZfMwahATkeHn6CAwed
oSycCczDoqCHaROu0yVN2CEsvarQM9eqSSmNACtiRMmzSnpl3y0vnfZuM1bhj2h7VrsFqUTH
5WoJtgmU1FNIKIDOvQDbKgt7cXI0SkY2dgUevxATnuPTxNZ3jemRDl/CMvwBnpigS9ZYl6H1
AoauqVnrbJW5ourMMjJHpVZdG5mOlpUiqLOIzDM4Kx6tPKtW/Zfxsr19jWiU6/MEd6mlFRmL
59xT/HrG1oJJ7UgKL8CksSa/lLlN3Ke28QfkmejHamVuDtF1niKSlFqADl57GU2/W3alAFHP
f5qLteSC+BIO1uxBHiYtdHGI7jeBNq2AcMBFgrmgv18KvmoVKCBaWXDOFHQJ6oYodW/3wUPB
luQCTjf49lTyw9aIim1SLQJReAepY4SPv1kNvQU/GYFfnU8wLzRMoC60pAgXGmJg6+lq8vss
2QzuVAt2F+IORBte5ErXrOEkmptwG/gjwiTgt23ktsPplfnx+ZQHbB8XrQc9sHouJt+03LQr
mEvFLE4mkmJbjD+C/Rx/T0aqwbRLwJeJ1hrQ1hqsp+sxxhzcxf04zIGrIFiGs7yE4xojnACT
gzuPXSrawOlv19QyDowiY7QvmdFDMsCDRUdPp7PiKrI0+BNMQiTLVsWAy8iyYVUR6amfedzg
IVTcYJZgOOMJMUmHKVK5DtZZEvNk+VrCKnq5RoKCrjOmtYzt9ApZNrXZb3EJety1egnhubRy
nVgkUKsDe4k65IFCvFrvdjDiH2cGXTSAG8GYRAfOiAigB6eRtsHnIs9jax+OAIzpplDXN8J0
3Lr2YUWsF8dHZwMm63Mm7fbp0+PTl5uH2+1C/Hf7AKCFgdPnCFsAOUYYhRorzJUYcQcd/uEw
Q4frOowxONxoLEwmMHDgPtExHrKK0ZGhqTrK4ZhKZdPvYXs0+Pge6VEfLbuiAGzhoUAcq0VY
WRWyovXVGy/vR5JIK820DMxX787daWS8fXDn8g34Kog3iokhBO7YSxirO+4NZi44xInROVCd
bTvrvNm2F2+2959OT37BNNqbRFlBBj2oe3PzdPvv3/5+d/7brU+rPfukm/u4/RR+x+maFTg5
Z7q2TbJMAMj4yk94n1bX3eSY1IjHdAPeS4ag6+LdITq7ujg+pxkGRflOPwlb0t0uRDbM5bHj
HAiJtQ29ss3glVyR8/1PwGzITGNom6c+f2cjMOZBu3NF0RjADAf6JSbedMcB2gfHxbUlaKKd
mAkjbMBJIa7SIlqSB/0DyZsZ6Epj8L3smtUMnz8HJFuYj8yEbkK6AlyakVk1nbLpTCtgE2bI
HqojanRtDTHJkmmSwwuXVQO+3BvDK50ZrBRMemIQw2FzFbveuNLMfd75XFBELsBJC6arDcd8
jIigR1uGIKQCIwae6SSCRLhJhuEG4rHAXRI8GBFvjtunx9vt8/Pj0+Ll29cQQn7a3ry8Pm2f
QwgdOrqGYN3lM3lBU1MRBi6yEMx2WgTEm66/bn2SKDZmparyQpolCVgtgADQw5gfuxFXFvYT
daRHHeQMkRPsIOYfW0OjbmRh9dhPHxvMgARTuDqTM6ve7WCfWYTYqeq02Nt/qaVJfILH9KqW
YC8BdoMSovEWmsozbuBMABwBmFt2Ik4RgVTZWmqbeIm+bT8mGVAI+L+hn/Gr9ZJcPTIH1S5o
Ue6Gm6RMqMTHwDoEzrtO6rN352Tv9dsDBGvoRDDS6vqKpp3PdQimAlB6LeV3yIfptEoO1DOa
upqZ0ur3mfZ3dDvXnVG0FteiKEDDVUNTL2XDl7LlMxPpyad0YF+DQ5nptxSAEMqr4wNUV83s
FN9oeTWR90BbS8ZP3UmiQ9g2IzCEwvQ1CAAVVc8c7d6tpkfZH9IG5x38ZUgUnccs1fE8DTx0
2dQIPuMIcTRZCPG5ajcpDXFvC+Y8pAtMV6dkOAhpA6/VemKBIbyvu9p71gJgXrVJ5+XPOESS
tYnwXJ/mxPBaVOBJknAdOgLbF6ZNpzZ6Dr+PYAIPMoE1PkhfbspUd6eDgEhZF819IAA2bEwt
LAuId6/jruaTuQ1WtxXBqEWd+jYB8TxiLG0jqedxoNx4BGMcDA3oIhMlAMRjmgj+bJ/UBwl7
hLEBJu7nkN5yeFUBWbZTpcV9UvvN/hKUYIe4uG9MPKYWGhB+yLf0d7WZUhYT5lSe26vdJJDA
BkyxVqJkfDMdoPb3NnP65I9PwyUennrGWY+9/CHSjF4AQFGE+OXx4e7l8SncC+wCphmORGp+
7hBFxnFR+ssqOPpZhIDlu1UqBy1QdADyQho4XYChUIA/120n85i9UXhBA9CDUuBAOUtuL/rG
8zPKQa9r01YASE6TT8ZWTLmRYh9YTugc6Ej+bg/HNHCAk6KKAmKMi6O/+VH4z2SdUynyliEM
ttJYySn9jBMncA653sR3TJ5awCELVEaEFx7TzpO9yRxgId6oRpkgWaEWVQPowzvJTlwcpfvU
Wirz6deGbgCiSmUwy6M7n8CcCgAVDCFXPcxhZA0dzHQeLoLxKuTy4vxs53KtTpIR+BtjDWkh
VpzTV4h9J1IBT2YggnFd413kNI8FRjFXe1tp6plyAFHQaMwIjpE3faN57Y6Pjqjzcu1O3h4l
h+Xanaask17obi6gm7gW4krQOJVrZpYu78iIql1ujETzDDqsUe2PU62HKB4zRKniBfFhThwz
jKnF8cG1/yrO4w2jeFwCo5yEQZLqGmbdOjd0CpXXuc8YgLLRVhsUXxYbV+WWzmMPdvdAaJpo
SDhrg0ovQcUrnygJ9v3xr+3TAqz3zeftl+3Di++H8VYuHr9ivVYS5vbpATqqoQxqGrFjt5H2
7v0a/ITfIgOnSa26dqLuNZxy29eR4CdtnNXxLSAzCxamVZeY1gVzBl3tJbo8p0dwZYxWkmY3
vYAI3bdchxnSlS9+UoACCxOmMM+lxdqptdBa5mKXcZlnF3woDKEEjRxsKoqMWTCVm701ZJ21
JDb01DXMR016Kliz10uuSIPoaR40a/HetcZMuhohMve7M0uWySVMStybjGxrKuyZdMnKUoOO
JRU9nsUuha5ZNWnlnYFYx+UGjmIhq/iCb+cKw+f+hHVtqVk+nfMhmt/QvbW0XGJCnHb7YWIK
sDsYEcqLeIb+lO9h2KDC2XRPUrcSLR3CgKXK92aoRd5hcdOS6fySaYAaTUXVoYznlLUiOu1p
e39nlg6BBKoUrrVFOFiTCUf1T5Nzc2UBP8/YLImXoqAScibMH6QNf5Pnzrvsehr0mEJejDU2
i+Jp+5/X7cPtt8Xz7c39AJ+jqApPylwBC/H1rmP58X4blchCT+mZGVpcqdYQ/eTJ1UNChPg6
qXFJiFao2dmFKex80ne9iZ979vo8NCx+Am1fbF9uf/05lgoegVIhXKM3zpPrOvw8wJJLLWbq
FAKDqlqq8CUQWRNlFbAJJ5S2hAHStmFeaSuOlOQPoY032ckRSPl9JzVlS/GqI+uiIfu7Dww2
k8Y0T4qYhOitn0H0y12p47fwQXr8Kknnlxph3749OiZ6LoXai8nwJj4j9WZm+4Nq3D3cPH1b
iC+v9zcD/kiBVZ+UGPra409tDBgxvDJSgIcn5me4Aio9xvCDF3dPX/66edou8qe7/ybXrCJP
jCD8xOiKlFIhde1tIgCuORSe11LSMAoooYaBsn1I4wzrzvkSIWQDcQkAevDOVZVWKUnDDTjF
rEDH1cSFSpeOF32ZRLyiuH2AqOQE4ciUlditkpgmzmi4hxkka7efn24Wnwb5fvTyjbMIMwwD
eW9nkq1craP0HubLOyzGZ9MQb43106jFVCDvaaHiGSCuBCnvMi5JBT7ev969bG8RaP/ycfsV
JoiGbkTLSaiSVhT4yapwKR01Dy3oB6eu5A+IdcB0Zz4UHo84RukcAqWNwai5mKnk37si8xPw
eW2fE+oaH8RgpRRHhLQfefrSfisbl2GB+aQjCYvDa1vibnNFjrzCeyqKoFq6ve8GHzhM79g9
vYCg2EfngKIRMfoclowrKD1bUpMz1qD7HpcQZUyIaGARYcmyUx1RrWxgS7xzDLXdE6n5a18I
NjCG6+vC9hmMGPIcM8TgV9y+2QozDy9FQmGBu1xKK/ri0LgvvIw1uyIF60un/BcTvtOTTFq0
Z266jYCMAOE2ebgd7bUkdT6BLymLSbcG36DMfsirqfCXly6DxYUKvwmtllegqyPZ+AlOmDBq
wwvRTjdgIGEbksKjaYEOoRsIavG6zRcphutg/wXVCTH+UHaje6FhtoLaw+RkH6DGVU+JzHnX
xxZY4bmnRkHtQ4kur9srviynsg+tIac9Q8tVN1MGIAE9hHcMw1MhYhV9VqkvgyA5UEYVbOiE
uHcdP5jV/so+Ifti+Yl9jMizgYlfjLTgS/u98vfK0w2lq9sTvVRrXxIxY2QazHuKvnQCM7N7
n+dDflRw0NcIpAGpw1wImmKw86gLhMHwlCGRRU0iqdKZuoMrOPykJUu/epcqiGo3gxmy1QSh
AmRNzzqvsEACIQpghjziVvhuTJZ9Yul0j8Am5vz8DE0V7kbU+YAL90mjSbVguO3wykpfRtU8
B0jTz8NuzPBorNHqYps1tPjKTmpbIPKsTk+GxCQslPLA4CYoN4sWKi7KMzugwtX6lw83z9uP
iz9Dld/Xp8dPd9O4E9n6RR/K9Hu2AZ+E0syxVO7ASLvIp+pKfG8F6Irzizef//Wv9IEgPuIM
PLGjTRr7VfHF1/vXz3dpRnLkxGdJXhUqVOgNjV1HbrwLbPCRpNWgyVRIM/Li0do5TqqzkWGu
BjuSWbSOac3hd7DlTq9AE7EKOLZUvj7WYKHnxXGSSkbzQdUD9IbFv1CZZlqz9JkG1r/7eEKL
92k1zVAZn5mSbKxktt+O9zelhj2KpTkQsZKKjowGDjA6ytqZok7/qKNPsHvvpKeDXGYUUh4f
gwCq9brBientF/XEEsLipJbtXjO2N08vd7hxC/vta1ouBjOzMoCjfI2qQj1CqE2uzMg6yhHj
q7h5zL5MRoxnV7/HhEO6GdCGwZJUw5SlWpjbf28/vt4nwS/wSRWqr3Kw932d2T5xtcliJz80
Z8X7RJTFezdImnj6Mjx4TKayM0umOR4HwIfXofiyhUPYNcTjovHuISQCIGglTKx/AJv7bvyr
x3kWfUkxeBcxFJC7TBT4fwgB01eh40scL23x9/b29eXmw/3Wv6lf+Fv0l0jumWyK2qJ3jza/
KtKYsmcyXMv4MrZvrqVJkk747fT6bCfzuQn52dbbL49P3xb1mNvbC3kP3t8OF8NgGjuWBrO7
W+FAo95AhI/T3pyvKQrfRcZr7C5EyVOwJWpv3vqv4y/7iUuDFiA5cuGmvbX+Q19Xcjb5KMMa
1jTd4HGJxy/U6ZalngwSQk431uoPWwnunXzRE4oIVZ8hHK9PDXUVNzyY9KAuPJ7N9cXZ0f+c
0wdmrzgzKl6LKaStpkAvMaekenmVXGJziAnChTdVwlQnCU/4OVu6uaMV8ZsFzKACdDUXvw9N
161SkbZeZ12Ehq9PC8Cj0W9T7+3SUGMM4m0nvmksE+6/85pJplFDgsFnz4b0SjyIzzr42g7M
XaxoHxiKY9eTwAnE7Au48IltAmPAEGfg7pY1I1PQOwPXWhECFJaAwHm7MO7y7sVxs3356/Hp
TwCI1PUynJYVmZwDQx8hbvwF9i5RF9+WS0bLHQIUuvap0LW303PpbsywUWn5sKRxW9rwYg1f
rdMV0e3O0ztfEUbFpMDUNvG/4uF/u3zJ28lg2OxrVeYGQwbNNE3HdclWHiKWGh9E1N0VeWiR
w9muaSZJyQ2AcECScubhZvhwbekCFKQWqjtEG4elB8BtcYyuyvY0YWYkFqY2LYCJqbvlxo2o
cJMmy9uhOe2+y9t5BfUcml1+hwOpsC8Qaig6wMHR4c/yEK7c8fAui73j4CAG+sWb29cPd7dv
0t7r/K2RlNWBnT1P1XR93us6xrn0XYlnCq9SsebM5YzG/rj680Nbe35wb8+JzU3nUMuWLuT2
1InOxiQj7d6qoc2da0r2ntzkAMo8/LCbVux9HTTtwFTR0rSYffZlMgcYvfTn6UaU5666/N54
ng28A12RBdLFf+QIM31TB7LH0y43Pj8DPqie9ZHAHLKFdBDYHiCCecg5nzWKhs8YTD3zvN7O
/bs5AEbJ9upkZoRMy5xEQCFPi0c7vcPtm+jCz4o17t3RyfF7kpwLPrniGudXcbqmnFlW0Xt3
dfKW7oq19APPdqnmhj+v1GU78+5BCiFwTW/pBx8oj/l/JyHn1JvSvMGkHID59SQLANvHfOhN
dqZa0azNpbScNjdrg/8IjZ31cRCRrubteN3OOC9cYWPoIZdmHqGEmeaCXgxyVKcASg3a4UNc
DTe0Y+7TIsjT6pln4REPr5gxkjJ+3sddYbSycemT9ex9NUGIi5ft88skY+lnsLIAkmcXkWsF
Lko1cpL136HVve4nhBiZRvJntWb53NpnNDqbqd8qQAh6zrAUbsWp6O1SagiuTYLceVHiiUnq
MYK8BsLDdvvxefHyuPiwhXViYP8Rg/oFGHPPEKV4+haMDxDt49PZq/CoNSptvfx/zq6tuXFb
Sf8VP20lVWd2ROq+VXkASUjCiDcTkETPC8sZOxnXccYu29mT/feLBngBwIaYcx4ysbqbIG5s
oC/4wCQVV6G7I0MP4MOobI1Nrf49+J2s4dtegwWJCfMAitDy0PiQyPKdB/qME3AV+zeqO5yH
rZedvoEEArBYDUc2HECiGg1hSLWQhjPkffqWAwqQBl9YbzQlj//79A3JSdHCTvIP/PYVbDkA
3R8tMppVU0mm4A2QnyzeiZDsxLG9EXBUUpNb3pUBVmmPAoUHABb4XuATaNPx3HJZges24Em9
5ecRXFupV7p5F11aJSQtuV8d0L69/Ph4e3l+fnxrM1jee7zL+4dHOCEjpR4NMcAAe319eftw
kt/grFwirXKqIieoKpss0W7nTsh/A09uPgioBJjWA+ETok0NcAr1qPHJ4/vT7z8ukKED/RC/
yD+40bK2zlfFejc23pF9J9MfD68vTz/cLoO0HZUVgPaW9WBf1Pu/nj6+fceHzZ6Xl3ahFe7J
BKN8f2nDpIpJldhTN4sZit4kBbVjr63tp2/3bw83v749PfxuRxPu4CAfOoOh6B4ycdDVpGTO
YjZkOD19axXNTTF20Jx0vPFA0xJVX3J/IbLSTizraHJZPrlj04rINSdPSOoA3nWtqPRL+7Q6
BTb6i5ux9/wiP4e3QTnuLlJhECvhldaiIn05Ri53L6vTNnTzLI2NCfRZd+h8cCvWL+SQOwFh
rM4Tb74HnIMXi+vZ4UMgKqnY2WMItQL0XHnsQy0AWWNtMXKjDEkMV3ySCqPiJAoPAiewz6cU
gB8iqSIEM4OTFd1bjnb9u2FhPKJdghEpy1gxftYEz4SELYVGkQAS3c4cdGDtlCLt8sfsqOt4
vvcZyg9q3X039ZdJNjYghdwReBJN9rm9aYPfTQbYebLb0FiHkuCs2rUio6dPUe1/OhOGn1r+
MKOhZuoHsIodRiXVuic7gczX+7d3OzIo4IBUos60IkV1LJ3MpsIkKkb3KfAWoHISVToEtfTk
WBBST9xjB0gotKuzaspJ/nmTvUBUUSMdibf7H+86c/gmvf+/UeOi9Cg/I+7WRDUDt+86blPh
5sJOoNvknbAGGn431cXj0XLKMHbhiad8zi34G541zgvVfChKXF0As484y49Mm5OjBaQi2eeq
yD7vnu/f5TL4/enVWE7NKblj9jz5QhMaO4oF6FK5uIi/7fNgvSvHYZGPBgfYeeEFRO5EIrmU
3EFMwxF0xFJDbFyNPS0yKuwjVsADFRWR/Ngo2MfGg+YwFsSO1SNii4n3edAukIp54CvGkuiJ
/64bWIANAvMASHRsD7ZHx954Xij34OOBUIfg5QqPzJRMGmauUtyBqUHImHoSLHWUGMlGiqjw
gJaA+ow49exBr3wfOsR+//oKDoiWqEx1JXX/DU56mjsxVV2d7NRFHNEsH/hwD3fcCSMa5DZ7
7vqzcqXwPQ7Jn0T2mQdDxZDcU0DU8PdblqxXdYVCiwCfxQfguvWgPAqvDUd83MwWbrGWBI+j
EPIJPL43EMmp+Hh89lQsXSxm+9qtl8YmOUNqKrYtUB2TEtFNri6YOjED1BTgj8+/fQIj4/7p
x+PDjSyq3ZNgxot6URYvl34VxFNZC+8E0DU09YJIXBqcmBeFgKPX4DEykwpartwW8hYkLQg3
yHIZQjNGVuXT+z8/FT8+xdAFIzeIVUhSxPs5+tVNd5fZupwoDDon4wG0Tk6B5+kn9RiNYzAU
D0TuWM0cYY+AXIVjV9VclKD/0UhB8OvV9v5fn+Xm5l4ams83qmq/ab0yuALcTlIlJRROfbgu
DK9cgttsQ1+RHWY2DHy+XM5Hn4di7UuPS7WXwFDLtKp8ev9mbyqUPPzD2UhJKJ60UgoMO21o
MOPHQqE2If0/MPWOpI+w/j3ZpALn7WxaFFAsrhcZRULBUnfzIC1l6Tf/pf8f3kir/+YPnZOB
br6UmP2GW3XjyOAnaD+c6YLNQngJuy6n5JaoMugWKkgorQAb1E1KgDl0eyKJ/Bv3D5Tt+q7+
8k1cRwqZOUbFTpGzBZWE5pKqjHZ+gGQfR4kpgYhG7XUq4czl7eSeGFlmgbVPTxRFw+vLtTMX
ExMmyV56pcl2ypnwnPeSXEiME9Z5ELDy5Po3Ih6L6ItFaA8KWbRu5po0y/SWv3UyzPC7jblZ
NPB3j/E1DTAHfZqkBWkYvGOahLmFzEwZlSajXBqZrCzZ08F2fXv5ePn28mypQsaJfAIvtD3h
O9RAkxSGAJ77KyVsKIs2UdkKOba5y/kpTeEHHjBqhXbYIhMnzuankwavLOewLLNyHtZ4eOar
s8KPSjnhgEgdO5Wm4aiBiqpSCfW5h824WIUQVIDc1bcnVXQ95zuf4PMaMxY6rrVdMYhtvQeE
WZM37GQGPw+MAYQg4+SM14cIoqZ6QwW21OioF7zGHMmBqrLsrzZ0qqMqXo+d8/k5o4Y3vn0E
qKOdTt/h8AgaG4OndAoKQduoBHYkksutoTY01b5gBUiCVHs3W6CLyJq17hd9wyvX6X2ac7mo
SMXM5+l5FpqnmJJluKybpCwsrWKQwQeJe0hPWXYHqg53wUQZ3COGh0kOJBcee4PvIVAV44av
YLtMDQjSq7Izt/OQL2aWoU3zOC04IMgC/hTz3ZhwKBuWFkippEz4djMLiX2AKw23s9ncSkxS
tBADFei6X0iRpQKDchjRIVivLZCojqNev53hKuuQxav5EnM6JDxYbSxkwhLOUh1OeAT4xKM2
diP1N9kuNngIjPtUpBlaGl2ZNkidS5IzDEoiDt1VTVPkFJOvJFUTBsvZ6JulFBZtLDqoOVLV
hPg0avn69DpSn5afkXq1WS+N8Iimb+dxbSXytXSWiGazPZSUY0mhrRClwWy2MDeRTjuMTojW
wWw03VuwgL/u32/Yj/ePtz//UKD079/v36Tt9gHeWijn5lnacjcPUh88vcKfZv8IcO2gGuU/
KBdTMm3cwojaCGnegj+p9KTRqV1pRnHV3nMbj8odBESNS5x1ZOycIWFp9gNcF3JfJ3fyb4/P
6grHYVY5IhDfSDpsBu1siNkOIZ/lim5Ru5rIHYERtRxKPry8fzhlDMwYIpvIe73yL689+Bn/
kE0y089/igue/Wz4CfoKI5Udpr8GgKi6q6u6Y0hXeq+f+/HBymSBMzdyUsRwbNxnZINIJXjt
lTiQiOSkIQydydZKaOV4MOsauqS3Esvnx/v3R1nK403y8k1NfxX1+Pz08Aj//ffHXx/K3fT9
8fn189OP315uXn7cyAK0sWest4BWVu/kHse58k6SIY83Nw/EA1HuiSywGsAv7pA1nF0H8Lh1
SR1Q9on7u9EywxfSUz0WZL/RpOmRYcdxjBrECVqxOAFfZ1TAQWwAm+ColKwBRRmtiWBVWSEy
yO0AGrFRoHDa6Oi/Jjka4A2UUt0k/Pzrn7//9vSXOz4DDvPYXvAbxv2uPUtWixn2sObI5fAw
yi4fycp6OFZWn3ZhNARNgOmKuJaN0slAEGgV4t7Nflf81UWeHIkQGq981lMvk7JgWc+vy2TJ
ejFVjmCsvm4RqY6+Xoqo2C6l12XA+RZeb7jyz/0NETwN2BLBY0mdyKEU89V1kS9S0VYeJLbe
1IuDcGIsS+YBsOqnptgEazw4ZYiEwfWhViLXX5TzzXoRXO+6MonDmZx6AHnw9wRzigeG+y46
X464JdBLMJY5R/IQGTmmE13A03g7oxOjKqpMGg9XRc6MbMK4nvhuRLxZxbPZOOG1+Pj++ObT
KtoEfvl4/J+bP2ATIpdPKS7Xwvvn95cbANd7epML4+vjt6f75w7I4NcXWT541/94/HAc6V1t
FipzxncavNMXUheM14NExGG43owZB7FarmYRpnpvk9Vyon9Omewge163eynOupjHu+sGUAf7
s8JY9CrCYC0V5hIHUvav9gqewX4CGuIlG2rQvlrD1f4kN9n//MfNx/3r4z9u4uSTNBJ+Nk4+
d/PLygGJD5WmYg7BjllwDKDAxOgfaHJFzxMbTLR/B3qYtGPGB6cz5N+QxSacLoPLMffObaiK
rmDcCJwZx/tKdBbJuzNS4NvuxsYuchdrBm7dKjg49e9IyCoeEE3HQ6/oKYvk/8ZNkSy1d8bv
udEyVWnUugvMOQ11yk2Li7qvx1dmchhVJTk0VeI5qNQJHMqGX/xlNtQMynVEkp7IqOrOF2V5
AfFdP67ftQ9sZAr3/N2JO2fI9W6QUnoTzLeLm592UoNd5H8/Y5upHasoHB/Ay26ZkDCDZ1Jd
fU0fyCCxtFILwOZW6YR2Tg6J4QaIrDhxGgls951Toa8TMj2GbZdYurDIE9+5MeWwwx0itwoO
8MopX88ZAXWek3rcQrJVZ98lLqz0ss61jwOb3bMHc9FzrEzWgXuQ0mXdQScVnsQMccIrIenN
WXW9QkL0PH123NuuK9t3ACxPMx/ObuUeWtNTGM58DN4ZJ6c+eXr/eHv69U8wyrnOvSYGgo6V
DtEloP/NR3rbHoChrQAXdI5eNpp5bIdkaIrvlubx0rMHPBeV8GzhxV15KFDoCKMGJCGloLY3
SpMUCP6Ooc5ks4A9tT8xKoJ54Dv23T2Ukhgi0LGtgVMWFxxbWaxHBS0cKHHq+E1dx5rgU43I
yFcTSMNi2eDVWbIJgsANz/T8dIzb1HJKmJ+eG3lytsKHFy5Mq/fRVPWlfsoFI3gDqhinw8S0
Q5VEpL7TnSluHwPDgzgvOb5BmZodp6qorK2hpjR5tNmguMTGw1FVkMT5rKIF7uiO4gx0Jq5q
orz2XJ/km22C7YvcY+7IwvCvVF824MaozQexvard4FjjwhsPYac5jGfao0HOGoudm7IeOjPz
FiyTdaApt0/jtaRG4BOnZ+P91bPxgRvY591EpVlV2eA2Md9s/5qYRLHc6FqtcTUM8ggAtubW
rNX5iv0KgLekbuAScXxDggMNGy9NbM2tYSZShu2izafggLH5XJKGeEIBP+WJ5zJwozy4nIta
CVoRDSfrTr+2iVJDJytKk5dwb2suF5ZMA+xNlXSwSjmU+FUz5gMncjEvEzBYbBMuTYPbZEEU
xaov/iIgz1y5mScys8dDjpJ+9gBe1L5H3HVi4Cy8b8cV2ZdsYsQzUkm7yk7/P2e+88386HEU
8eMdFp41XyTfQvLCzv5L60XjOcIteUu/HSS5/HKVvcMMO7M+LK7sSXDkm80CXyiAtQxksXhQ
78i/ykdHARz8pYX7schuWS/mEyupepLTDJ/r2V1lRRTgdzDzjNWOkjSfeF1ORPuyQSVpEr7r
4Zv5Bk0JMMukcgvnwLDz0DPTzrUHJcwsrirywoR4Nbl23Znce9F/Txdt5tuZrZJDX+BAso7e
6N0pFRXuA7gkm9lf84lWnlnCrLVIXTee4ElFxoPF0eoBSIvwaRW412ViTdRwXLLX9iyn1iJ8
IOoGArTgOwqHGHdolM0o/DYt9naA6jYlc58H+Db1bttuU8+Uly+rad54n0PBkcwaniCGm1lb
0duYrOWEaE7Es+G7jSELwgeWU2WTM7BKrE6pVrPFxCdWUbCTrB3BJphvPTg4wBIF/v1Vm2C1
nXqZnAqEo59fBbgoFcriJJObEdsNCgueJ0/OfJKayPImo0ilgSv/s4G/Pa4cSYfzuvGUQc1Z
at90xeNtOJtjd55YT9luUca3Hq0hWcF2YkB5ZmN28izeBltPsk/JYt+hfihnG3giVIq5mFLf
vIjhxF+N+z+4UCuUVVeRKXff5LCecluhlOVdRgm+1MLUobgXLgawGc+popydJipxlxeltOCs
zfQlbup073zB42cFPZyEpW01ZeIp+wm4J01uaQAXi3sguITjLhyXebaXCvmzqQ6+21uAewa4
cQcie1zshX11UA41pbksfROuF5hPbeE1ioRZuKY0aSr70ac+d0niSZZhpSfxQyEkRd7oP2x6
r91kL0fGByxTlriC5Y4Bp7yPkP306f3p4fHmxKM+EAZSj48PLSgPcDp4IvJw//rx+DaO1l0c
9dThAsl9BeZ5A/HBV5jpZQLjCcuVJ39ewWmR3OVo64MWmpmIiSbLcPMg3M5+R1idFedhVZw5
eC2QlYePX8V4ZqONIYUOphLGpHKb5u3TirSGOsbr12yMaYZaTYYZ2DTpwiP/9S4xl2qTpVyO
NFceD51vquChbi5PgPD00xgN62eAkYLssY/vnRRy2vDii3pkNbhP8a/69IUJfmr8qKFwAp/h
+l9FbxA8pcFI5gmqP8/Wvk7+bErnXEabc/j654c3ds7y8mTDPwKhSSn6MWrmbgcAyql1qEZz
ABNNnxuxyBrP+ugiASteRkTF6qNzzVgPdfAM1+89/ZCa5Ld7K2e+fRoicsgbOzqAZJ1qL5dL
Y1pusOtfglm4uC5z98t6tbFFvhR3ziEZTadnB6XO4UbD3bV6cHzwWPqBI72LCgdzp6NJlYgv
NIZAuVxu8NP0jhC2cR5ExDHCq3ArgtkSX5wsmfWkTBisJmSSFpqwWm3weEUvmR6PnoMmvYj3
8KYloSa1J1GwFxQxWS08SASm0GYRTAyF/h4m2pZt5iGuiiyZ+YSMVIHr+XI7IRTjWm0QKKvA
k73Yy+T0Ijxx014GUCvBNTbxutYQmxASxYVcCB5NH6RO+eQkkeZAie+shopL5YXbNsbQz+X3
NTGsIgsbUZzigwPZPZasxWS9Y1JKw2nijVGMr0nD2IqjumLWq82Umhz0q/opla51tqUnNiT1
wbP0ItEd3rBBAtwu8v+ezesgJ20jUgoWo6gSYylpTzq3EAxC8V0JZ0ivFpSyHY30TXxICQrs
foTtNhKjKWxq7Kj0mKurOtV8ChtNdOiMaqnpZgNAD1zPzbKDwA7uXfPX95ypv6/3f2bdDqsZ
Y9goTZc2dkpVna80Xk7q5XaNbYs1P74jJXHfCF1ro3nZ9Ks8tA3y+7Dua29bIFiNNAzmdOTJ
0tFdFQfBrPRgi2uRM6/rmnjytpSEu+DZfd5/CM7hIJcNVp5PHcgtEaCgG2ZBR2lITtJijzHm
CUZNGEKNi6giCH2/C7F37isTCcEiNxnKOTG52GfmLWU9T1lnJMZYnCX0wnILq69niszErRqK
Ux5xs6MdVhOigEW91IVUFSuwN0JidKrN7FFNSxLToop8rIiYpuLAgysD8dZdWCJ/oO34eqD5
4YSlAgzDzJezIEDKhc21gy3Y82rfh9BLlHXlX7MU6ryl8jRFnbOUfRB7SjelWCmN3ympA8ml
Oem50GMQO0byx5RQSfeEe5R+K6a1ppwXcZFh6q9tPahPbdQM3W4QIQO6pFULfzi8w5AgyXqz
xqwFWyjGyyeVtLYCW6FafHC6NJnpsUXZjZivPSInuWtndcwqnB+dwmAWzK8ww62v7RAGhZsg
WZxv5p7NvE9+OVtOdFp8t4lFtpe6Hq9cfCcEL0dZpYiI71T4WHThD0ibwgnZzubYtHKFliFe
dwDnKKsCZx5IVvID8zeLUtQzbYnsSUpqvHzNGzYWmEgdz3XiBMJsXTw4c18UCfO8+CCXBlr6
WsVSJmebJ33SkOMrfrdeYTEcqx6n3Lw81WrcUezCIFx7u9eX02sLYdsHU0Lpnuaymdmn/Mci
zvRE5KRxGgSbWYC3R1qlS+9gZRkPgoWHR9Md4XBbysJXw2y0w8RGLqtXp7QR3KPFWE5r5pns
2XEdeD6Sg4hLmvtqJlkjDGJsnBLR7MSynq3wl6i/K0CuucKX+xkPFwAJ5/Nl7W98r3zxGZCI
zbqu/5aKgqUP8P0KzgRmSIyqzUTo0+yyukoBeEZFssPZrHYuvB9LeOeNZq8n21RljefuDeuT
Zykl6O1HlhD3L6RcBHIL6eNlO/Ooj8MrvXqY15sVGnOweqLkq+Vs7VGJX6lYhaFnkL5222Ks
44pD1q7Pc69GveW+Q2atx4JxTPVUGVs4Q69INsIzUKS151B2s/mY4k41RQ+TFofBlTf3wC0l
dCnz2YhizUVN81w/0zKtDYgO7N2/PSiYb/a5uHHPa9lNQBCvHAn1s2Gb2SJ0ifJf2yDW5Fhs
wngdOOgqwCljcPMgQ6XZKYu0n8miVuTiktocfERYkgAHaPxq2dDm2rtJib1be4tN+snpnj3J
qN0JHaXJ+XK5QeipNcQ9mWanYHbEva690C7bzByR9hAJNugDYAQSMNIhsu/3b/ffIKo7gjAS
9l3IZ98diNtNU4o7Q/FoIAUvsQW4Cpcre4yknZPrA4sJqXBzLS++Fr7Ev2bvgT5SEOtSreae
e8AA/UygiQepuhMN8OUBaH9oS0LP1r2v8vdRE1oo1Dc4tDsCOmwbqe7RjK2LXDVjE9pIRT1R
vqCsqEIfN+ClETmNP+f2qmLtwNeBXaVpCsX6cJanEhnxvNW8tMVk0JpU/8/ZlTW3jSTpv6LH
mYjpbRzE9bAPIACSsAACBsDDfmGoJc60Ym3JYcmz7v31W1lVAOrIBB3zIMvK/FD3kVWVB1We
mkt82LWTitp3XKtNiWyrcjs2jsq6mCBoRsV5KPY58dqjAtO+hcivR1KNTmsM3NhdK93gxTGm
3aqCqrYn+rIuc7LtmjN+JyhB4FyR8lG6f335DRJhFD5Kuc4HYqApk4LGqHA5TSL0DVYhKqPJ
TPUDMVUluy83JWF0OCKybE84q5gQblj2ESE3SBAbPeuiy1PColCi5G7zYUi3t8aGhN6CgQ7s
LYzUPWr7m8i0I9QLBbtrcVVyyd70FRuFt/LIQOGORwkpt2XG1kNcsUGiYXJ/dk3vHJPrY215
NEYOvM9rV+8KPRs6vlSbrssYCTRn9gO+wkv7z8y2PB2lyLYu4WYvr7RI8UDN4afIdKdCwIAJ
dsl1t0CcDg7XLjw6DMrph84wvRf5cHUvcSG9SVHrGI5TtXAEgU0Wg3RKIfaeejEv8m9ORdds
FPTuxISrfa4btk1EHhWTyTq4E84ZZmg/zQxh5miRt0Wjm5bNrCMadEjlywBt4959NPzg5wPh
xhSemdi4JZadZv+JUNWrTykagKbN4sgPf3IBUSkPExckZZbSIYAuHRVn1xJWXGw8brNdAffx
0A+4aJOxnxbrHtYlmeG/tzia84YtMdUn69lxjORlSYZqncQA6Q4QXa49WLsM3APYiknquQtc
T/GXtoaJNlst5DxQ+Vs1eIDWZgpj2JEBdPaOfYer6jBuzRWHhNvOH1/en799uf4EHy2stNyb
O7IPwmdptxYnAZZ6VRV71CBEpm/1/0zHI1eP/GrIVr56vTMy2ixNgpVLMX7aDNagNrGuzllb
CZlidNi21Abq9zK2FEjCesLGMylvrGrbrMvBJrLijo0PmU3nFfDYZzjGabM7ljKj/wm+cZYD
oYnkS5dyBjXxQ1x1ZuITPrQ4v86jgAjFLNhgwL3Ev9TELswfoq0zncrsiadxwazpuQAep/Cb
A+Du+a0MXShh78OGLR79nPc+OGNK6GZn/JDw4iXZSUjc6zC2sRmYvLazg8XBomKfu3heGbch
mxenv97er1/v/oDQWTKsxd/AEdOXv+6uX/+4PoH+8+8S9RsTmcGF09/NYZexwU+rnAEiL/py
u+d+MDGJnMQSFlwAK7aeQ/d5URdH7JIDePpeNVIuIsB6uf/A/eDrgPuiHtcMhdpYOl3qqMvS
qa7mhy1xbgFed49aHoqBUgt/EgptUtYXisI/2Ub1wqRKxvpdLB0PUlsdHQ7ShfulkjfmWkmG
tOmZBGefnaRHrykLZfSYQ6Ooinsr3K/RSiURSrvPfnoOO49mxgvyeJlDLZ5ak1XpsTArxonS
K+7CMASX9eT74QyBNf0GhJItVPFgKrWvqahkECib0ZCwXqNAc1L42iGTjNhQY++NO1WmZn9o
soe4T+1LI4DJTP7yDD57lfi34HdrlyrzqG113/3sREebMeyHFhDW0AOazMsWrCDJrCrBmvSe
C4tmfpLJ77PQbBWQuZ5N2f8LIhM+vL9+t7froWWFe338HzRuLKuRG8TxJTPD06kq/tKmBVTD
98Vwarp7boAEtemHtIZQUqqu/8PTEw+kx2Y8z/jtv+gs4bSNjkK72EoS5R5Om8hwgfZhRVXu
dQWBx9oA9/MyGEfgeiOi2RhrL1939fgMYypl91EP9iJmEvJ9/6nf9AZtdrGqUrlSsDOLviJe
yteHb9/YLsf7G1nF+JfgNZSHuiQaQl54aPfZnFznLb5JCTla+AqhAfkpbXH9Gc6Gi0WqRJsB
fjmquoXaNOrepLE7pIl31Sm36laiD8mcVX3an7lGqNkB6zjs1bczQS32n8X7vdataZ0GucdG
YLM+2F2e6WbrnHw8xwGmhsKZ00Zp9M9lI3U8x8MAPSrEJGcT5DfJhScGY9yoqbvO6gI2bKu4
MPIFDoT5vbihVQvJY1+RXRu5cWxWRTRlbXfTEOPvtqIl6U5kLN91z1aCp3IPrt6oz069G2ar
WG3SxSabRFFOvf78xtY+bAoi1h46W405I1rkdBFCm70GOFatOJ3wIyRev+CU6S8CNnEQLQCG
tsy82HVIUcBoAbFIbfKbLdOVnxvULZFYQwzFJU60BVoxcVs/WWEOEKY2isLAXFG6LBiC2Dfn
qPnULtrAthbQmwhe12N7UnCG55Ldz/mJa1ZzOFVgo6/Nb7tBJ9fXtxp64XzLAeshJi7aRftV
l7LBD7FyBC0yy3HJWAQVAkXEnxAdlmc+5RxZ9F2Tp0dQF8blBbulzIoyceOAeUriAaR5u7q/
/e+zlNvrhzfTje/JlfIsNxpqsPEyQ/LeW+khR1See8Jl/Bljn1xlRZEyqmXvvzz8+2oWW5wt
wC0Vdh05AXrxTmp/CZVBdSl1hPKebjB46GWIfE4m72ITXE8lJD8mjLNUTHy7/L5LlN/3yZx9
/5IRLzw6DtdcVTFRjJnA6wiihHGha0npPDdaGkhywCjSNTxFXNIjrjIluF3Ro25JBLc/tG2l
6SeodPuANYLyVAC1hVZKhmmeXdbpwKYGbqvFI9Pzr5GU4cy3hUqx7doJlUaUKfLGDfX4BQoH
7RgNQCQZeza9KrZMRj76NgfMf2xqv1bOEWNFNKLwVzQSrRqsP3qR4SXHLCqoGjtIFcZN2m6V
NDFCEJktfW4952wnadLF31O3K1R2QtwciuqyTQ/bAisDKKxGhq8bCoTdumkQzz3brcyEJzZc
fN/msG/ixEEYVRtHutbvyCGMgeYUeSciKQ5+GLhoEdxVEEU2Jy8GflsoIGEQoh8bQpPOSZCq
sXG0coMzVjfOQp3UqAgvQAoLjMgPiFSZWIb37zQR6rW/ihYyFsJbgoxuPrDgZcdLVi42wLoh
cHxsWxrT7oZkFQR2nQ5Z7zqOMvd3p1p9Q+N/Xo5lbpLk9Z64YhAaIQ/v7ESCXQFMIdHW5XDY
Hjr8JcBCYfWZQHm0UvW4NXqM0WswLdGu9zQWtuXqiJBKNSEY6iatMBJvhQeMywdW9qUodAJB
VIKxQkpBQ8FENzNQw6ZNjD6LQrz57mPwEbuUKFhmatGg51TBeQ1GBw0qhD6cW6RN8z70kFQg
kp6HwYuqYpOxRjh8E5HmSVZFy+CenWBwTTOBgHsFJ9jYCfMLB2+zxTiBHwU9wuizXZ1j5dgM
TOo+DOlAmMOPuG0VuHGPSdEKwnN6pCG2TMJIUbKHlUg+/+BWIiNoV+5Cl3jFm5p4XaeologC
aIuzXbISLtnkyoV0XIC6bBr58EYBYxj91rj9MdgfshXaIkxI6FyPCE40h9vbFymqAzAh+IqP
zEfOSJBBD6//boCMemB4boAVlrO85bWDY1ZLiyRHhOjKJlj4uX/EgAAQOuFSDhziIqstZ4TI
qg+MJELpIbGccZaPO77QMIRjVQ2Dyp0agiid70ZY79ZZ6zvYmjZkYbBCm74Ol7bRqo58ZKzU
2B7AqEhhGTXGM0aPIgobzThGM44jPAtC4lIAuKL+xEbLkASej4gWnLHCphZnoFNLqHctlxIw
Kw+/Yx4x+yETdyJlT70GT9BsYHNhqdMBEWE9zBjsAIkuaMBKHMy4Z0K0WR2dz3grbOIgwUwU
29rQ0ZQf4GSQqjys4BCxONtsWuSbsvMDD5/qjBU7IX7PN2H6Koxdf2kPqGqPHb0Q6ZAv0sTs
ECzQsDpUqdGlNtaPXaTWcslE5z3jeU4U3Fxz2UIT31hz/dUKF1jhZBmiLwrTstT2K3aiRUcU
4wV+iNqKj5BDlicOJiACw8MYn6vQddDCtqf6pojS7wZ3qTEYHx9JjOH/XP4wwz+0NZ9MmbQu
3MhH17+iztyVg98nKhjPdZZWA4YIT56DrGvgRXUV1XjBJW9xgRWgtZ+gxWcCbhDeWPc4Rg+9
aCKGoY8Coox1uChQMEHf9eI8xg+M7GCMzTrGiGIP+4I1ZIxtzuU+9ZwEXYEYh7QsmCC+R/jQ
mnd/1KfNxN7VGRa7fKhb1/EIOrIzcjpScUZfYeMH6Fh7gJvWrD1QIjdjh3GIPcdNiMH18GPw
cYg91J/xCDjFfhT5yEEMGLGLHDqBkZAMj2Ig7cfpyIgSdFidQFUE5VdslR6Q3U2wQsP59Mxk
82uHRSHRIcVuM17iGJqP9h0CqFtbd9c2bLh3XPQug0sxugMnSYKgTkPZE265RlBRF9222IMJ
oLRDgAN9+ulS9//t2GnyQyF+Cy8RDR7LYmSfupL7UIGItISHshGaF0IFcttAFMeivZxK1MMV
ht+kZce2idTwcoEgwXBUOOT55cLIZ5KqajJC1hi/soqC8Keq4ex1ut/yf3D2XHysojdKO9+p
coUs+RWKyIvjpis+YhhrRIEIplkOjCzQWJqpcD0UesoIVgK3g0bnV81YcyqJiHDfN9klH3qs
PPPEY1B/5ZxvpAYQvO7yuWwxLbNgYEO2lBheP/zVi25s25ZopFgeaybGvjmln5oD9ng3YYS1
1WXdNBDLASZqjmQxqrjxhjw9vD/++fT6r7v2+/X9+ev19cf73faV1erlVdVAmj5uuwLUB1lB
YHgiqesAtgZWaHUM2L5p0Bd+At6C1ddy5tqUl3C9xpQ32b7ZDGoXzeu5ylDyQgouL0/tjubT
xkeTlzNqZNEKFYsI0H9zwgQFjc2VpwM4F1Ezl4aRi0l/LssOHqcXQVILcRmUn5b53T4YQjde
qgRcGPnnM9LErF8OCLkfwEGni3DS7OMBAqOKJhmJ+VE6kTRaKq3KGuxigI4WHgARE5dNgGQX
6+zCzrArPTt+Wx4XZmZ9Cy74mUyLPUH2LKVNObSZh46n4tA1YwWQr8t1xFLWCgE3zn2nz9cN
236ompah7zhFv6YBRQhdRHFZtajCDXHkehujeIxoNtCuXRokQjFNT0VElTfT4fdOrk+WdX8k
OiF0RA2VDNYZEyQdixh5KytbJvlbA2n8ogY3PEJt0hoWjOdH60i0By76fKzPcUiy4diB5zsK
ymaejB5H0YZMkfGTJT7EEfpMcmEsF+2ZzYyl/tyXieNbrcEW98iB1YLKGVzdedZ8FAJLn/72
x8Pb9WneF7KH70/KdtBm9opRl+esqXU1Ziz1Niup1JWRV85Z4C2bD3gIhh78HTZ9X64NhwCo
59F1VqcqXCHrf4kY36AiiKMnPkZmop1BFna6Ej8/1gOr31Rpj6spqp9CjJZLVuNHFw2I62oI
SKH4k+dGmv/88fII9g6jDxdL77re5JZAxml9QBlGAjvNhjhZBYSHWQD0fkRofo5s4gUKtjCh
vIzG8+Ffp4MXR47hQoJzuEfITVWctXgcM2tXZaozSmBwJ8GOfpPN6XkSRG59woyCeYKGvtBM
s9zmQoN2YByGq+MBv2ZCRYddgvD24GpQSl4TUVVUhmSkVIYUgHOw27GRGSJJhb5FcwPHTLrO
XAh2RnjyA8SuDFdseYJizwnuBjCo68tM02EEKkuIbWpkW4mDzMdD2t1P5ogouGoz0+xC45Em
stMRjjd0thvgsENY+k8FAp8s/MLkV3CUqSbAPqT7z2wxaHLcRzNDTOroCi2O2zpWL8lnYmD2
GCeHDqZ5JwbjpMBlDFLQwCLnpa26NVPjEKMmPppFvMJvuSUgTgjXehPfo5cuzk9ufJ9grxyc
O4TG9TanFvuN565raviDvK5XX9HfU7ZJQTMjeZhs01MAz8FWUVe5XF1ML8FshaAndM+EdCoZ
cWbR0+mLDFmI+3IVhaYDRc6oA/XueCIZlmqcfv8pZsPQM9F6QLl0fQ4cxzI8Vb+QlhXCydZQ
Pz9+f71+uT6+f399eX58uxNxHcoxsgxyXAbAtKaO7mh+PSGtMKMplkLT3Gim5v4kbExMWhzF
sZVKVR/M/mzTip14sOuwtg9dR1eaFBqJpsWNxoyoMaaYoljUxNoypH0KPQ2hNqyShAGRggjQ
Jx8ljxjNOyY8CEyABL3OVtgeUlNGNcIDCA5bl33dDe6pWjk+OWylHQ4qmp0q14v8hdDBMD5q
PyBCvoimw/xXqQBhdmS1HD9xkcla9oR6mZpst0+3qAUml52EWZYhUAkiKlH1q6jysIcw3kp1
oD12jTTXGoqnenE/4GzcREKyV1Q8PsH2Xdq/7QgJnFuQJKFqKlyh5pEbnw1pVN4HmRUGh6/4
4Od3X9KpOHo5vHiomG+npJKDemElSdMZxWJsyjN40WuqId0WGACcOB2ES7H+UBdo6vDawB8b
VNRcvQnH5J+tsQJgGF2emllw/InDAE87zQMflR8UyJ79atGUxdEGZY3nDSTP8QyD9+oME6Nk
sWzTUQP5Xpwubn6uniQMjk8m7KHrrQFx8c836Z6dVom1Z4YRZ+cZII4pWOEF5xj4aNeUfZX4
DjEeQKXIi1zsbDeD2IIdUq0OAkCEn6UN0HLXcAOQM1Z+vo8GFEcVNBSO2CMoVhiFeG3Gs8Vi
UQEUxHQK/JhxK4U4XKHF46wQ7Ugu/Afo8LWPMSZP1QEweLGDp5m1LquIR9STnTWIOxQd5GH6
PjpE1TudObYVkcLbHD4XLr7+tcc4dvAW5KyYZiU461RjZMtSWmGZZxGFZZx2Zk7v1W3qoBMc
WD21vvRBHUchLiMoKHleWeyMeU+2WexzJ0zxIoD6nBv6+J2ZBuNS/S/APEpRVYex4bk8vBQP
72QSMabSZYLwocF5rk/MkQU7dwOkCewabxTObYlD18/JrJMuUPbNUG5KTRwxYR14G1K2+6rs
Mo0rPIV2qke87rIvJoZGZ5OCoIco/cNRTWe+4+q4/8qRhb1QQaj7/acGTRUURlqUUzPp636d
E3me6xbLUoWUwt5sEdNldb1QdN6mxzLTAxcxaspOjR1E9UJdMXaXYl9oldmV52CXe0YlSkrJ
aCx9l+J+nkXzGGHTtK8HJrqWZLVJb9wwXg7HZtAtYqChirxLiWDF0I1DV6T15xRTTSi70XfJ
xQjhAQXdNl1bHbZLddke0j3huI1NvIF9StSUdVTVNC1Y5VOfC39AJTFuhTOLs9aVoBFskMwY
QBMJnL/v+7ocBnvS0GU+r5vzJT9irl54dG1uZS58qc5PNF+vT88Pd4+v35GQzOKrLK3BOfT8
scYVwfQuw1EBKO+CAAHfywNUasIQj4gA7lJwh3Eb1+fdL6Bghfw1FOGqQAKa/dBB8F2sv49l
XvDA93PTCNJxVXkmLc2P0xlUeSoGljiB1uWexzvfb1FXhZAmxLz22I/MUzrHgm5EFLhEBeCp
cakdWLKThyn51EfkPmcuUGYF57Jxp9BVqoZQEZB+dzkW2k0hpMvdFCBZi2tTMTSvT3d1nf3e
w8uEdJSo3JPy1NeHjWfsfzMd6RFOZwVuWrMqnJPXovfLLZpezfUG9U54eHl8/vLl4ftfs4vO
9x8v7Pc/WH1e3l7hP8/eI/vr2/M/7v75/fXl/fry9PZ3c971h3XeHbn32r6oCjXco2hHWOO8
KXO4wCleHl+feE5P1/F/Mk/uo+6Ve4L88/rlG/sFvkEnp4Dpj6fnV+Wrb99fH69v04dfn38a
40oUYTimh5x4/ZKIPI1WhNw4IZKYcFYgEQXEtA7wGapACANIOTD71qeuygQi633fwa/aRkDg
r/BT/gyofA/fdGRBq6PvOWmZeT6+cwnYIU9dn7D5E4gTOxNES4UBAGFZKNen1ov6usWFdTlV
QURbD5uLAeMjocv7acTYQ6NP09BwAMZBx+en6+vCd2yFjNwYlxgEYj3E7lK9GJ/wejzxwyX+
fe+4hKGIHEpVHB6jkDiRTdWPXOIpQ0Ustf5wbAN3dRNBhLyfEJHjLM6/kxc7uFnaCEgSwu5H
ASy1KAAW2+LYnn3DflkZLLACPWgLFDrcIpdw5yYn59kLjHVGyeP6spjy4njgiHhpLvJBHS21
gEDcSsMnXqYVRLKIuI/j5SG362PPsRspe/h6/f4gNxMl6JLxeXP0wsWlHADB0uRtjqYdswUI
QsJ59wiIIsIz4AS4VcgoXOwsyOJGCslyFsc+DAmfb3KNGZKacl43IQbXXZrZDHF0bqVxXM6l
7xzfaTPCk4LAdB+C1d61xkzFBosiknLa5svD25/K+FFm4PNXJnT8+/r1+vI+ySbmrtjmrFl9
d2mDFRh9A5lFnN9FXo+vLDMm38AzEpEX7F9R4O0QYTTv7rhEp4tQ9fPb45UJfi/XVwgBoAtZ
9jSL/MU1tQ68iLA3l9Kf+WCneKb8D+RAUbO2tAs+KhyYPF1aHQ57flYVdf3x9v769fn/rnfD
UTTVmyndcjy4SG91zUqVyyRDlwd9og60Eyz21Ns7i6n6sLUziFySm8S6LwCNXaRBRLiZsHHY
g4OKqgfPVAI0uMR1qQUj3t11mEdIQAbM9W/X7+PgOriyggI6Z56jWrHqPD2Ars5bObqFtVbC
c8U+Df6fsWdZbhtXdn+/wnUWt2YW515J1HMxC5CEJER8mSAlKhuWJ6NkXONEKdupM/P3pxsg
KQBs2Fnkoe5GA8SzG+gH7Sc3JlxR1tgWWTSfy/Uk8NbHmtl06bExGM0rT05uk3AbTXwb9IiM
3ulHZO8Pf9e69/lx7PufqBXkqp+Ym+t1KZfA8K2bmK6BNdtMPLlF7N1jNl14TCcMMlFtpj5D
HoOsXPsyVDgzKZhMS9qL01oW6TSewoB4lLgRaQhdMyd3dGo3NbfZl8tdfAzvtv1NQn8gVdfr
0wuGn4fj9vJ0/X737fKf232Dubf7GCma3fPD9z/RvoyIks921M3tcccw+ZBxX6EBuH4wM4v8
bWok0USkPIkq2vMypx7IYzPqOfzAlNmijc38BwiNi5bVTZ9KycGp8HF2uO0bXPJki9dPdN3t
IZVdKiG3+DbE/G6DR6enPGbhbGG443YryhQzpYwaHpl5QhBWVc4373jaKheAviFOA324Y2pe
EHVazt11dAtkFNEJqUBrXNqsdE6TZGqHAOkxWVOoE3NDJo8cUS2sKM9vtU0Lb2VKaR3q63NY
S4xcOWYpu1DJQIaiH1EQzdJ4R+QHY1Fx94u+KouuRX9F9iv8+Pb58cuP5we0SzIX1s8VsOvO
8vrIGR20UHXjZkqfQGq4d2RAM4WCaWIPKL5GFZHYMfvWXk+b085jpaVmY8oWnqMB0XXs8ZLG
SiW9yaqFvWO72Rt8I1GWtWzvYcV5acqIlej+uI89KXcHouQY05IDUtw3/k8I82hPXY+rjtNZ
G2H22H1dsIwPTtzx48v3p4d/7gpQFp6c1acIYbcEVryUMEQJJzipxlPwQaIeYbZcnNFZfnue
rCazeSxmSxZMYopUYO7UA/4DAvA0cidHR5RleYL53CarzceIVslu1B9i0SYV1JzyyWJCBsi7
ER9EtouFLDDQwiGebFbxZE61M09Eyps2iWL8b1Y3IstJulJIrjw18wqN6jaMooK/mcwx2+Xx
2Ewn20kwz0y59EZZMlmEvCzPcA4ZKd/pfirZORY1zLl06V6tjGnz6KDa+WE/Wayg9o2nAXkW
gt4dQn/GAUkhWSprGG25jKfL+B0SHuzZ7B2SZfBh0phxWkiqNWN0XVwc8nYenI7b6Y7uJ/2k
n9yDNlFOZTOh4qqMqOVkHlTThE+mHqaigr4STSur1cojUt6oq7JOzm1WBYvFZtWe7psdfa44
69dsXViKeEeuvwFjbQE3c/3w+fGPLxdnN9DPq9B+ljUry8JW7YeYbWosCNVpqKSqmDlSBW4a
Lc8cowm182Ke870oMMJRXDToTrXjbbheTI5Buz25nYvHeFFlwXzpn894xLaFXC9nztQCGQL+
iLUVRlUjxGYya9zKEDwL6MsyJSvtRYYx/KNlAB84nZBG2Yowl3sRMm1evlo6W4qDXTlYWOnb
Yj6djMAyWy5gDGxzwV7ewSvZhavhObNoPAVsPrzK2FFQfoBqhpRRsavduvdCCvjL8QmyD9tG
bikvVv1Z2TkuR+LyMcwbdfvkk3RxFp3dUlX8hiRRTme0mtzJA35Jx5NnUc0YdqQjnVpHAs8q
Jba3GJzgMATs2D4/fL3c/f7j82cQQeNB5uw4bEMQtWOMpXqbCABTZlhnE2T2Qi/3Ky2AaBYw
UCFFjlwShhZYJfzZiiQprWfgDhHlxRmYsxFCpNALYSLsIvIsaV6IIHkhgua1zUsudhnsKaDN
Wuef+qRq32HIkUIS+GdMccNDfVXCb+ydr7Ae7QEY8y2cyjxuTV8ugO95VIf2N6FxzyiNIsBT
2Bs7RYoWDoEGZTLsigrTu7k6gjV9/uwTHhKWGThISp71VVOk9NUBFjyD+DHz3c4AgS+5OqJg
/4XepKVwNWtk5UXCsTKljCkRBZPXXhM6eLgxDDvm9HZe4GlEZ+XEQZ7GyrXXKaVzvPqaWIqj
Fyd8zzY41/gaZC56M8KJMcpsY1Xq1yexy6uzb5vTWB9K0rd5iBltcRZWeGeVb9/EfuU5rHLh
nTmHc0mbegAu8G3yWGWex3lOC1+IrkAU8H5oBWIT989WVtI2emr9eJmC+pfCFu5Dq1zv3r5F
f1HvBAtBOW6quU87VgOgHIm884yjxJqn3voxK58vjKMaelQAPetJwnqarJzlJNOVexncSSjk
Uaj2sPDh019Pj1/+fL373ztQv3pfrJEJIapmUcKk7AxiDStkwIyTGg7bsltqaPCNogsFRnbE
jao4URciN7wb28DGuEleepzKMvBezel6M5+2p4TTsQRulJKBNkN56BgVxsV6bfo8OKgViRp7
WBjFBl8vokXKIWjydpMUzcZTvlgvPG4AFtGKDOhr9MzICdsYf8tl22B7XMwmq6SgcGG8nE5W
ZHeUURNlmXkr+c4kt6zxTLnhxh4vocwOAl2Ozl02umTvOci8zsygn86Ptk+ca4AkvyfWDWJy
KfGymhwWxBdRqhkSY4L4+JwxjEihjFSlXSve7cO2GsvfgpnVGi3OtnkSw6oRbpOKMo/arSe1
BOCPvAxzCYpkKbKKMj1X7XItagdgX95XEEPk7MJ6O+rBGmOsUR1bp+l5VNXYbNXCOymzrR4f
9QiLp+u1JyMAohPpfZZTeCn2vkzSiK6EaIp30EoKpvPwKaJ6PcqL6aB9uSg6tC8xB6JPnkwH
gAurtcfEC7ERm0w9ZmgKnQpf1BO1NpozHCj+0nI+W3viImv00hdaOeviGfm/WYc78pvSKpqq
2fpbH7MyYW90+k5FhfaiE3Z+s7hm74ld37P3ozV7Pz7NPY4aCukRWBHHo30e0DG91LoDvdGT
7f2GfqPPNUH84V0O/pHvWfgpeCangcfc7Ib3T71tuvbIo4jdx9K/2hHpX+ZwgExXb4yaCie0
bvwt7wn8VRzycjf1mSKomZMn/tFPmuV8OfflJVJTp2EejwdEZ+nMYyist+Zm7wk7DdhSFJXw
KAkKn3KP1XuH3fhrVtiFv7Tknugh6sAUbO2N8n7Dv7PFKyUll/6lcWy8OXwAe063zl6rtIZ9
/G/1GGqF+lbzkOnJQspGQ6n/cYoUJVf+F6DzfOS/LedOL+W0aoA4J4yIbpyIx/rLXlghCOHn
Lf1kVfJsV9EhvIDQccLrEPXeSm4H/Do1pr9+lN8vnx4fnlRzRvHykJ7N8YXI5sGism4IULvd
OtDCeh1UIGkmP1GQGjvWhoU8OYjMhqHFRnl2+yfaC/h1Jr5dYfN6x0q3TMoiGEn6GgTxICXG
4sDP1D2R4qrMaZzWnWF+SOlWBeOyy7OSjpWOBDyVo25D/xszop+CfYQGudx3PA1FSd3xKuy2
dJgAC/WA6PI5nH3NO7HECt6BsKPgJ/Vy6cysc9lHGreYCwwh7GEvKmd6fGBh6fRsdRLZnmXu
l2RSwHoYV5dEvuyzCsud9ZDwLD/mDizfifGs76H4o7CSOwyYLZWOALFlnYYJL1g804NtFd1t
5hOnqIU/7TlPpI9CT+idiNK89s6yFIaxzJ0+TNlZxeu0ocqHdjeiFRjTMd9Wo7WUo+Md9y1A
0P8qQc65rKJCoCIG9Dd+cMkLlmEA9iT3TveCVyw5Z87GVMD2ANo0CdTvJgTcvK4n0F5+MLtG
O0CPo913FUXCMvVuHI0LlwI0Xe+4SyYcD2kHrV7KPdWqPJSJyA72t8iKs3QEggkIxwZ3tm7g
XiTufl7alxBqa0B7BVAVKb1U8UlBcPqQnztmt8PTgNOLS20Qwl3AsGVJ7q50fLjdpW7Tqn1Z
y0one/fwr/FwbQsZuGVPQnic6xHbiCzN3SIfeZnj13jKfDzHcJK6i08nHmn3deiy6zARfEKe
dr88rFlSSPO6iTr5B8s9UjrBF+ZeQjEs6SzaQYoygIMwIsM230fC986G+NFzJAJZibsuk+0+
suSjmoyLjCX0RYf6HCTCZri+IQgv/vzn5fETdELy8M/lmXo2y/JCMWwibr+Jm43QHvjH0PO4
VrH9MXcbO/TUG+1wKmHxjtPqRXUuPNF2sWCZQ2drm1cvDexc+PZBK7dIUCeFaENy4tYna17C
z/a0JwNcp2ai3OJU4hUX18CheAcePywMFFCgDTFHCi1wo0d/7VPEsKxrfKv9aZSnt3b23l9f
XtFo8vX5+vSEbxGjQNJpNL4FRKCMvR/enkIZu/SV2MKy9QT/BXwUrjxXX4g9qsgEqcfqAilq
aJBYwgQgPSawgvu9fSeoWtXZptBRypEirYxTIwUZthIRAXGCdF++Xp//ka+Pn/4iYnP3RepM
si0HMQQj2hksJUjlethN4AAZ1eAfxNu39nWqYUh9jh0d0QclA2VtsPZZ93eE5YJMHJfxUy8g
9MId/NIvT5ZIOEDbUTh1kyQsUULJQOlo9yc0RM926sjT3nCc0OdUMZYFk9nCtEnUYNOEVPOP
0mVgetHcoAsXqkJwTkZfocBUX/TY5Xw25rTcmIHbFFQH/nKARcQ2i8Bl0EGd9xqFIkAq3uyc
AC5GDSsWiwaD/KZOJuYB60lkd8NToaUGrJ19ugOvF6RhYo+1otX1QOvdrptMHA6glImE6quF
29kddBR6eUAuA8roXqHHARUHMBkrTPM0A6IpiBlV0+YUxrO1x8Fc4bto5nLus+zW3VQFC4/r
ssJXEcMwX74GV0m02Eyb0Sy9hQQfr4PF3/7q8oo21dVfJIPpNgmmG7e6DjFT7XBW/d3n6/Pd
70+P3/76ZfqrkjHKXXjXvQ3/+IaeD4QAePfLTVD+1dk3QlQV3HFyAzzrbkiayArY3kNhVB0g
hjB1QJj9Yx1an1Q9P375Mt7JUF7ZWQ+gJth9q7RwOWyb+7waDVSPj4WkpQuLKq3ok9si2nOQ
RULOaHnEIh3UzvdJI9tfhCJhEShGojp7uoDYDIev73JtqZFVo/D4/fXh96fLy92rHorbLMou
r58fn17Rf0Z5mdz9giP2+vD85fL6q3nY2mODEaeEz9DG/lIVEOp9ugKTgr1PlvEq5rQk77DD
e1fKUNDuZHxFM6cRiyKOSVbQqYG+YRTwdwbiVUZdZHDQ/1rY+PDdW0ZlbVxQKNRIP+La7Hrg
rqi0ZazODEe2QVEp4cyPZmm88tz8KzxfNZ6L/w698MRFUGixnq1XC/qxqCfYrDxGHZog8D1M
d2jfCaDRPJi+SdAEtAmdLr3wBfcZPs7jQK3w5Xq2fLO867PioqdvolcBeZqUFcwMYcwoBGCa
5eV6uh5jRoIpAvcRKAdnelIhHnAV6PhevH/OITY7pvYrkY78UwG/3mrdEuCxDBz42/FMdwnQ
8MP9FoXwbQaqseWRVhbx2gNbRVwY9OV0QG0y+nRHwcJw8ZHLwO51jeH5xw0Fb9ZmEp4eHsvO
zo6EtxHss7X9cmJSkOmVDYLlajZmvT+n68WSaPsohnIHx/x+lnuRgXBDDXeYUi6iYDWj2i1k
AquXDIRqUcyIpneYJcW3AYwnsHZHUUTbNS3JWxQTqm8UJnDCgps4TzQFi2b9Vt3pfFqtqU5W
cDuFXY8L74PZYQwmYsX24zJOptKjJOh7mwl9Wvc02zSYeqxThhpgntMR0m8EizXVNCg4W4zh
PAWll1gh5THQgSLGTcD4zW91tVykY34yhgW37qUmDGJibxPm7oP+OvhwXAiTHgOm/MT2EkvQ
hz3xkW+zZeZEkqK+fhORK0zjximmdR68p4dXUDC++r8OWURpLslNabYmFx9gHOclgmBBzjvc
ptaYZTwVnnddg3I1pzTRG8Fsbvp/DnAnAZkJpxa7rA7TVcWorXC+rugeQExAZXgxCRbEyZDK
dDmbE60L7+frCT3AxSIiLxd6ApwAxFZChFHvMB/P2b3Keq/myPXbv1FJeWced+ll394wKvjf
2/uBzI4jUUX1i4oG/9YSAFlp2jcZNWGpY46REzvGvHVHN9DyDTqWbrTzZcrGnl1oC8qzneXZ
hbAh8ceeZRlPpI3FhGs2JLeek1lSYfTcVO6w0vFnx6eWNQILGhfxW5mA4GhmjdSXKAJgdvQF
TKdNM76PcnQDxBalu9RSrG8oukGxygZpxVDtoFYvd4T0nfRe1q3+gqHHo6fHy7dXa9Ixec6i
tmo83wBQlPbs/tVj1JZMxAb3sN7eXb9jOAUzcxZy3wond+dJwalnE83HfE5zOPeUrG46//Rb
2/bxfL4yj3qR4gdGQnTP07d3wmq6PATUUVYo30R9c9ymoLZayWg0VnkK9rh//atHYtwT9VKe
wAy0pqCJoQ1cDQrfBXdHcmtMbWvZtYqHTT0II6bAlb3jmSjvLQ4woDy9ISxuzPeAhvGheRnl
HucoVV8k3nQPQZqMV5QyoIqXta1oITDd+iP2lWToYgNt3ux0ISJSntlBkDWYXk4dMkR7N/uy
u8OIrCDzpPeVpVQLUhw07c1qBKzvotl9er6+XD+/3u3/+X55/vfx7suPy8srFQRofy546ehs
fcKmd7gYq7JiO0FaRmCS5Vts6qGV/UqMMH22KHmibb0M8D62d2JZyzZhRZVTMYviKA6Zubfz
JGllGorcPlpuYPiHDLWCFLqaEbd8bWV0UtAyNJ55tvUHUcHOOZQfKu4xFQsTz5vzrojbIo8O
vMKMRLQNSqGuwxJqwy6IbiyGkBjjFuGl9KFg8SjnaD+iyvZBoqWm6aarTzKY/El+MsYLB8eo
37i9K0R78oRyQauSCiO5jEbVINEvp2HVltuDSGjnl55qD00lPqU7fbNqMpnM2qP7DKPRyibw
6LtB1TTHsPJkbtA1FPQ9jsYWaeRPu4eOh2VFDWyTTxcth1PDUCn7iB3jUVUGou0urel7Pt2S
koyV1T30oIUQQDLtXk58gyg8hrl1ucXcaUWZB21YV5Uvy4XmVGei8vJKk2bYNGgmoOwpUzhg
B3MoqwSr6J4tIi1xqBdZSk/Bb8ILYvvMLfOUD03wPWQnCctyuqU9o+SAMcZg1z/UptUnpsoD
HNpAF8xKCqOeQxHXb+XR9evX6zcQv66f/tIunf+5Pv9l7uDIaC9j+oHlxnC4GfoJus3cExDZ
IJNiESzoJ1qbakqfuzbR/GeIPH4WBlEUR3zlcSNyyHx5fk0yiV76bURvTmbbdAIomgzwXUrO
99g43q4UyTF6t9VEoj6KrMtYkXo8aHSXb0EsImUDz7QcZvhJFiIzbUk0pbz+eKZSyUNtslQX
/QtDEwYoP1YuVP1sbcsVoAyTeKC8NZOqtS+EL/hhbmZG7wWVdG8Jd0VE71O9ehjmlCzasW87
Jei2ecEY1FRCD307f/l6fb1gBgfiJkglHxru3rtvJEpoTt+/vnwhmBSgzlrKPQKUikBfGyi0
0jp3+GaNAOoGQJEN0vKtdVYrhiMMHWNRYhju6q4/vv1xeny+GKq9RuTR3S/yn5fXy9e7HCbc
n4/ff717wbf2z4+fDCskHeLv69P1C4Dl1b4l6QP6EWhdDhhe/vAWG2O1G/3z9eGPT9evvnIk
XhFkTfH/2+fL5eXTw9Pl7v76LO59TN4j1e/J/5c2PgYjnH5yaYr533+PyvRTFLBN096nO082
KY3PCnpzIJgr7vc/Hp6gP7wdRuJvUwbt+/r50jw+PX5z29/LTALmaQNbZW1ORKrEYLz7U5Ps
JjKgJrMt+f1whaF/3u2uQPjtal1yaVS7y4+dESbo8TFPmekLbhKBOoZ7EMtsD3CLBD0yJDuS
QZIMuiGjracmJiXs7+5HEJZ9ty8eC8kdCW9Qbux58b9fP8HxoNcyxVGTY7b69oMvU1dP0xQz
MtBAh7ctLzrgIPQH8411N9zhqUyiBE0QLKj74xuBk7qzQxRVhpk9RvCyWm9WARvBZbpYmFk+
O3BvC31DYK6j0ri2EiZS4B1Dvd1aOfUGWBtZZsUGAs0du4zHlGIAhIet2Cpym3FntQFiBFWt
/u9WkmVGpKp6ibN/IJnZrZWn7gLB00jA35jrbf3Tp8vT5fn69WLnmmJxkwRz412rA9jp1xXQ
fKztADZVmLKpeW8YphGMvFbUaaibjzxmszV1GR+zwAzBFINqFltRfRVg4wDMGHeGS4OuOYid
fi9z2fKoww4B4DqKQyPjjfPT/vhDE304TCdTO+Z6FMz+S9mTLTeOw/i+X+Gap92qmRrfibeq
H2RJttXRFVFynLyo3Imn45pcmzi10/P1S5A6ABJ0974kZQCiKBIEARLHhHeQ9i6muFRwAzCq
3ksgqbArAZckiYgELGazkXHI3UBNAFqcicpHTyotS9B8zC5xUV5dTnDZTwAsPZr52GAwzXQv
e6llqMzdx+/H0/4JPLmk+DNZ8GK8GGHeupjjydW/60jb1F7hxTHmJ4leYAdGXd8bxCk5DlCS
E6C8iu+PpHkzcuIDbwFMu84NglZIpdswznI4fCxDn5Rs3+wuMOtCfoGd1Tvt2mC+vUWW/niK
azsowCWZPAVir6NAuk/wLSLYtHNaoTfx88l0zB0JJGFa34101/omUq+ipZhFoLavJAvMivWi
TOSwkKdFuRvha9AyAvxQ5+dFsETuONZIbVfz0dCeppYJzzEcZkmVGn4QtunjkRwoQuF7ZngI
bR493Kjab09SO7I07A6q3/F4eFaROPoeEC+AMvakuN80AgqLynBOBSr8pjLC98UlYTDvmgoD
aYxcDGkpCHhPVEDGSLHOXek8csFKru3d5WJH7Erzu/SF5/GhvfCUo9rYyDT+uxHHetNrXN95
dL+X9VFgbPtYoCeiO7lF1QWFyNvnuj71uq+FJJtqaTTI45rRb5Ljai48Qe0vxTtEAPbSKZgN
55yzlERMMAfI39MpkY2z2WIM/r0iNKAT4uEuQfPF3Cy20/IQXGCRHLt5VtaG+2cgplPHvVEy
H0/YYAwpa2YjWnhGQi4d4QxSDE0vxtwOJMWB7M1shqWglgRtJ7tUtGcGXFt7klsePp+f26qW
eP4tXJMI8/A/n4eX+x8D8ePl9Hj4OP4LDu1BIP7M47i1t/Xxyvrwcnjfn17f/wyOH6f347dP
M5P+WTrtAvO4/zj8EUsyaWnHr69vg/+U7/mvwV9dPz5QP3Db/98n+/R4Z7+QsPL3H++vH/ev
b4fBhynHlsl6RDK7qd90sax2nhjLvZaHUVokBda3RUZUtiSvJkNsVjQAdmnqp71dJHgUnKGb
6HINXr4cb9kjoCXeYf90ekTSvYW+nwbF/nQYJK8vxxMV/Ktwqj2C8PqYDEesk22DGhMxyDWP
kLhHuj+fz8eH4+mHPXteMp6MkEYabEq8r2wCUJFI/A0JIE6iwHBLb6lKMR7jhtRvY6bLCpOI
6EIrp+j3mMyF9Rl6bctFdYLAk+fD/uPzXZdg+5TDQoTtMokatmSl0FWym3POS1G6BSabKyYj
tiZGMNwXi2QeiJ0L3tlArRByf4QOW1GJ/PrpozeMXszd+3nBVzlVxIby4gnUb0WAPBCLCb7W
VZDFnGZW3Iwu2EJmgMA7lZ9MxiPsSAmACfEXk5AJ6+8qEXNqnABk7rhiWedjL5f84Q2HnNtG
t2eLeLwYjohLJsWNuZMVhRphz09sSmIvKgTPC3yW/lV4kBuqBxR5MZyNiQoel4UrG2u8lat+
6juu3rzd1EyjR1EksWWWl5Mh65uXyz6Oh4DE6240wu548BufFUg7cDLBVrbk6mobifGMAdG1
UfpiMh1NDQA+YmjnppQTMKOezQrEeisD5gK3IgHT2YQMdSVmo8sxFyKz9dN4Skq4aciE8OI2
TOL58IJVjuO5PgHpiO/kiMtx5RPn06Ws3VX2318OJ21FMzL66nJxgQZN/caHN1fDxYLads1x
S+KtU4f2J1FSMpBeI1aGB8MyS6RhW8gdmD3L8Cez8RQ7jGkBp97Jb7ttdzq0tSQ3iT+7nE4c
fW6pikTy39BmGg03RSs7uHrYP59Ox7enwz/kZEKZERWxdghhs+ncPx1frBnjxjJK/ThKz40l
ItYHfHWRlX3uo26LYF6p3tnGMw7+GHyc9i8PUgV+OdAP2hQqfJE/fVS17osqL4nNhQhKCCKM
syxvCfhLEZhlCJzhqZrP4DtLtM2315Pc/o7MseVsjJd5IEZmuUNpTAxdlQslbuaoCFnmMShZ
bIcdvWJ7LL+Iqh1xki9GVvCVo2X9tDYHoL6r1AMYabDMh/NhgiJfl0k+pgcG8NupVbd5xVpM
jsviJHk8wvqg/m2e2EqoFB6czZaI2RwrHPq3ccApYZMLk8ekfFA94+T7bEqneZOPh3NOQtzl
nlQ3kKncAEyZYA1vr2S9HF++kxWNxTZBNhP1+s/xGZRSiLR4OAJP3x84kaB0Ckf8fRSAH1hU
hvWWKEvJcjRmbexiFUARZ7xzFit8viZ28l1EvAMBp+ts49kkHloa6U8+rLmr/3h9guhw12Ev
uqM/S6nF2OH5Dexjlu0RA5dhgnyJkni3GM5H1J5SMHbgyiQnpQHVb8KMpZRh7CwpxJjkK+K6
3LeUlktW2myT0JH6hmQukD+0PMW9A6BXJuCxF/uB70gQD1Tghr8qE/NhlaGC9d5WSGG9DWAO
v94ebaXCB5TK7UCPrNU3wemw5fcRFdeqZCKTJ6q4huJOSOGBGn6QyNvb1WnxZYT2SLMRtPxy
z78yh7138ghFWMI1XFlkcczeA65wsiH5o155VyGp1QlAufVtI5V+snd+hWQ9BSzuEHxXuPkC
kr70pxYsm9uB+Pz2oS7l+8Fo/MJrie5fjIBNeVGN7vVBHypNph7cqI6BjPcVlI83ATSyBW6+
CQHuAWCA4aJkd5lcw2soLt959fgyTeqNwHkeCQr6RngF3iZ5KLdzXSGKxMvzTZaGdRIk8zlr
EwFZ5odxBue1coxJ3jI6zqht8DGQL+c2OXqTLH+a64PgYurlqWf38A4Bb0qkPuszHOKc3nbu
DFm3FXhkyZabKg0gbXxs+1Z5Lw/vr8cHpEykQZHRJLENqF5G0IztotrdiuimOl3MQ7avirs2
fnaiTJ9I3QxO7/t7tZ2a611QoSV/gmldQvyAZB72qrKlgLpKpfmwSnrveExkVSGZWUJEZgTa
9NjzKTcQ4aosPP56XnljlCRpZQtz8k5H4HBR7/DrEuXc7KDC8bpEcKk++t6UEdNYn52sPYuz
J7ATZvkanzBpH8EcWMm4sbZQah8holM2VSfroiX1t7wrqqLTJQrd+GDlKFsj2LRk4F6dx+Gu
d6dAZiDnNCaNRmmirC8WYy4aDLCGL4uENJEtnKVpOYDlSZ3RRLEiYh0vRRwlS5xGEwDag9Ev
i5hOb+F33u4N1M8qgPeA0XBaX1deUKPgU6lZKFgQ0qsY6vCkr1KOT1I7UvIV+4X5nr8J65us
CJokJ+S4xQOdWG6Z0prMvULwO7IAX1IPaQbhrhzX2OOmAdQ7ryyJWdsi8kxAfUqfiz1oaUTo
V4XOfIOfn9RsjgiJmZp9mJJXGe1M8TtcDbYLsIF9XQZkr4TfdrhoP07JUg03fqQIIzmsEsd+
xVeFIK/4yWh9pSOFoGbfgRDONyC9HXnFztWb9UqMje5kvoZxp9Jl0fbegPBz0GHlCEkdEVbF
2pwLm7io0lp4qaRTHs7ujhifr4GekINfsr0owhUUfolWHDOkUdyNRTu9Y+NrFQBGmCOzl0KL
YCfXouIYlRLpUWRnRuHV3b5HvTt16ypLVJR+leKIL0gPo4kVDWNGuwUDnuV0CWqITu9Y08qL
URwqb/ooRbME/qng1HJr4tG2AcVoi9vc2deurGZ/na5B7P6rMEYGs5Vnt3FdZSWfEUNhIDJU
uakr4b7i9RFF6ZdkFXhVma3ElJ84jTSW4Ep2lifPJP9C+Ws8Bz0McoJHUMCzlv/ImmZIvPjG
U9Uy4zi7YT8bPQU6Kx/4gYigzrb6oLMdh1J2HhQUbXd/f3//SGqpilakUoBaecIGb6S8y9aF
l1Am0ki36Nb4bAmLoo4jHE+uUMCegoPZGWURrusMH9yiP1V/dvCHtFn/DLaB2sj7fRwdbGUL
aXm56mBVwcpCte/h29ZHq5n4c+WVf6al8d5uaVDxlgj5hMGgW03EjatEtGnpoKB0DuHo08lF
J2ZLi9sVyDVPClncEFWI/wBt/n0cPh9eB39xH9bUFENGMgCuDP8ugEG2RLqGFRi+BfLoR2XG
H9QrKn8TxUERcpLrKixS3IHWcmt+lklOR0YBfrJ9aBq193A3INVaSq0lfksDUl+DZjlMVkHt
F9IYI1GD8K+fsdZ6tke5aycSOrcCJBgLE6pZFJDAwFJFkFfVGdzKjQvVZsHz48bYwuVvnaSe
9Gxp96rFWOx65gO+rpyqU7WMrJZaGJQDh6gMKIOS5Nw0dpTxHbJzOugdyQmnwR7cSzFp2ttn
Wm3FhHM6ed/RqtyEqdQuPcfe7EvJh4db/9baATnSaxBJSc5IhLR8xMYxultbi+1NxCiVa4Tf
MhOTBXIDcJ3upjZozoMMpbPom+8NAAWDJKEQwHB7Jge6SWkkKnW1l+FzCY3NUjPndgfXY9yK
KLk9FURD1BAQ2jHYhYoF+euihlLyYEdlNiyRU4w03yLRG/8X3nE5HZ9r5k6UwS+0cqaX/Se0
2xXfW4uMF/x2rzl6vnddB357+vf1N6tRXx+hudsxwy4bsH1mZlIYWkq/KW0J41e24NLSQJ29
c9LKXiZSd77JiitjZ2iRxkqD39ux8ZvcU2qIw15WyKlJLm48/ohLk9f8/XUBWXVSh9DR/VbK
nxMPmnyT5TVIOVZtiUA3CGMgMnrOSYR1oaI3pC2b4fTNIGSNn3ok0LtM53BRpUXum7/rNV41
EiC3BYDVV8WSupKRp4JIQCISSJ4A2wiUDvGh5oWjFl/zkDPVqB/mG16o+xHlSPit7QPublJh
IUfOTd+zLiaJtnETehAuD1VM+CIciqrKoTCZG+9SxxTSNh86KJ8osMfDkXtemxXPDMJf6N85
rpVau+fWwpw78CLnZyrFTn3yRy/tjh+vl5ezxR+j3zC6NRrqKXVlILiLCRecQ0mwJxfBXGJH
ZwMzdr7ykg3mMkjcPTbSDPMkozOPs5UqKMnE9VnzqRMzO/NKPtuFQbT4Wb8Wk7nj7QvnRCwm
7olYTH/6ysuLqfm4tKWB2WrOUYM8Oxo7eyVRI4pSedwoqH3RiAePefDE1V8+RARTuNiyxc9d
TfMhypjCNdDdN04c3z51wI0leZVFl3XBwCoKg3yCUp31UvNTVEbCMC7Z28ueIC3DqsjYh4tM
mjIeZ8p0JLdFFMeRzz2+9sL47LuhoNqV/TGR7DSJ0+8QaRWVjo8nNbhaTFkVVxEuDQiIqlwR
x+wg5tO/VGkEzM0eIZHLJR3sdbj/fAe/JSuhImxIRAMNCxFJJS8tAVVE6ZrfM5bNs7xVr8+A
w8BNIhF1sKkz+T5lkHL7T2vPQk5BofxRyiKiOajOXBG1KON8VprUcKasb6cdl9eyR746dYaS
upswztmrtvasrO8mjhyLRfLltx/75/3vT6/7h7fjy+8f+78O8vHjw++Qaf07zMdvenquDu8v
h6fB4/794aDc6axpWvt+ncfVOkqhSm3ll7FUdr6QkkyD48sRwiWO/+67UKvm6QgSa8nP8q/q
NEs5vZ9tvz1479rhqZa3RcjXzTxDX7uUHP6ZLXhvsKU3CT0U99AD08+lBqnrlSs4bNC1hUfD
oU2ThMBggnu8qFJ1KtOoyfhIzTH8Ldo9uV20pbk629fvskIfDZBjGbmysu4A/v3H2+l1cP/6
fhi8vg8eD09vKpKPEMuxXns4qS0Bj2146AUs0CZdxld+lG/w/YyJsR/akIKoCGiTFvj+qYex
hOg0wOi6syeeq/dXec5Qg9lvg6V899ZMGw2cRvpoVMVf3tMHO5NMXaVaza9Xo/FlUsUWIq1i
Hmh3HQz76yqsQguj/jFcoE4RfQsuosQmXscVOAqB+IScnxa+y82sz/8/vz0d7//4+/BjcK+4
+vv7/u3xh8XMhfCYEQ0cJl/zJv9n+CIQ5AJR+4Z9nh7BC/1+fzo8DMIX1S+5Qgf/ezw9DryP
j9f7o0IF+9Pe6qjvJ0xH1z6bFLB5ZCNtO288zLP4djTBkX/dKlxHkNydabhFOWxHRDSezc8w
X1ZUYj4dMm9QqBGfmKTlg/A62jKPhvKz5C60tYZ4qaKAn18f8DViOxpLm9F8XE+4hZX24vOZ
FRP69rNxcWPBMuYdOdeZHfMSqdjcFF7OTRCUYi0ru/jKZv/x6BoCkkW8FZUccMd1cKsp27iM
w8fJfkPhT8bMOCuwdnbjkTxUDlTMCSWJLEfDIFpxS8I8sTGG3rUYkmDKwGYc50aS/yBJbeTI
etKIliQYsbGPCD/nVoZEnF1UEj/Bif7b1bLxRhxQtsWBZyN70CV4YgMTBlZKe2aZrZnel+ti
tHCcXzX7RC7fbfGtf3x7pBkbWyEjOPYPRc3WI0f4GbNLADyNHJzopdUyshehV/g2a0hN6mYV
MapHi2AKT7bc60FmV7a2dkchynPPi5Iz9hHa/vAgtD9spf7bQmfj3TE6m/Bi4TF8124z9gOk
oncHLHJpD7rgtRDhmJ05kdiTUIbc7l3eZDAB7hFqCKwjcAOte/EfTY7cN4hoOuJsK93Iqgsz
ezPAV7QN7HJqL7r4zv4wdT1mQeG2q+1RsX95eH0epJ/P3w7vbeILw1Lr2FpEtZ8XbPr09iOK
5bpNOc9g2E1CYzj1W2G4jRQQFvBrBJX7QogMyW+Z+QT9tpa2xZmzeINQNJr4LxEb4+KkA5vF
PYDQN6gUaM/5xtYJIGVz7gXNPa2lffZYkFdnJg0RStHtaGodWkc7NtEmWqX1xcJRvg8R+q5c
xT3JNbj+bC4Xs38cWW0NWn/iqktoEs4dBQodL9/yBwnc63+RVHZgy2VDQHRmOQcydnLXxLPk
idtEHxOoIyy4IbP3Rchb8ZeyGj5UkdiP4/cXHRB3/3i4//v48h2veX2pKnchVZpUdAdvvHvY
L7TdfscySr3its4LqMLXSqH4+O19//5j8P76eTq+YJUT6q/M65yU7Whh9VJafVKkFFfMUEIU
GXEUXUZS2YDaGUjEtvFYUg9J/fy2XhVZYnh2YpI4TB3YNCzrqozw3VSLWkVpIP8UcgyXETkn
9LMiYE979emjF9uNQcURw5W+RRlgqW1sQJrUK1ACmiCJiJ4I+JKVpNAkoNGcUnQKMoJFZVXT
p6jmDSq3COOVmVC6wcSRHy5veZUWEUyZR73ixpVAX1PIIebbnZvNcQm9JBgVi4ujZWeI4Ce5
nu92dAcrvDTIEjoODcrwRUHQILTh4IsFGwLVDRTU0hh4TxqAci0brjU9FHnUUGq2f9h1xgBz
9Lu7WoeikN/NUUw3yg1Uxfbl3BJpCCIP30U2QA/Ht/awclMlS+YlIpdrxf2Kpf/Vas0oF9V9
Zr2+w/GvCLGUiDGLie9wBS6E2N056DMHHI1EKxTAScGnOR/l3hHUIoszorNiKLSKxcDSR4zt
CZH5kRRQ21AOakFKU3kqzgdHFGoQuAzWRDoBnFQeS9X7dektKWZJpBzAZJdiT3kvbZSOR7E+
KgF2+Gv/+XSCoPXT8fvn6+fH4Fmfhe/fD/sBJE/7b6R7y4fh6B2umOBeD3xYh2ixt2gBdvry
tuTVKEyFGvrhaihy1MciRB4XMQYkXhyt0wTG4BJdyQECAoodfs9iHWtmQAN3jTeYOCNrA353
sou9kKT+nn58B0WDcBNBwGZpLq7h8AS9Oskj4m8qf6xwvVIIci3giLDECaVXGVh5pjuqgl7+
g7lXgSCKQH4NCZ8TEDuc4Vy1sGWq25UbLzbva4Iwz/DDcqMhHA3XgOmabntdRgpDu6H3a63u
paBv78eX0986lcPz4YO5dVOa05Wqco9HuwGDnw5/jK/d/uo4W8dSDYq7i4kLJ8V1FYXll2k3
T7oYnN3CFN3Agn9b05UgjD3uDjS4TT0oc26Fqjq/vbOdj0+HP07H50at/FCk9xr+bo+UdnGi
xlQPg8iVyg+JvzDCCqkt8c6ZiCi48YoV71KBqJal4yYyWEKt9ygvXTfW6qYlqeAUB2K1mMFc
FV4S1rIb6ZfRcIxmAvgxl9Ia4rkTTmoV0g5V7UsaPAZVKlXcAJ5aZmy6Ov1lxANaNgU50VUn
cVtZLtkUJFqUxlFqmQ+kQaGDycDjP/FKn7fQTSL15XWWxhyj6bHJs6iJkjVeuMogFFw76EHW
+bzijZtf5btunXiQ80IaULgKIQJ2d/R6fr8M/xlxVNLOiLAJoDut3TpNKERJfKEX78Hh2+f3
71qydCaRXL3hroT8wnjv120A1twhKKJlSM7BGZrOblJW9CiknAYo8YYtMgqv06wJ07Qa7mnu
woKLBus7CkGZ9lQXWeCVnlXTndDoyC1hfn0DZu0ZSrGSOtQZ/m7JVH4vfsFTQrgH/Vlv68Kv
1PJzdRvUkbyyQ8UplTGxHT+q+l8N40m9rnFjMPrbYpx91U4eFa0yqlHbxG5vm6grIqdDaUdV
LJ2vlNh8La2jtTC2d6V4/l9lR7bbNgz7lT5uwFD0GIbuoQ8+lNhI4jixvaRPxjAUwx5WFGgL
bH8/HpItUZS3PRRtReowdfASKUbhB3ejEenF/J4FXVqRoKpeV0LonahGn46xiqvgHcJFYFHQ
KDcZ7AYnyM9QLqaqfkKdaNeL1qBSsf/C8bxjW8RU7yrMySOtRtTeBeYsfnvmY6/6+vTd47Fo
NBxaJbN+t1/1SSCKCfhWwM5Ha2HzF/+Cg0kHBuOv0mMpuqLHafwZiTC0jjy05GAkzjQYj57Y
w1jhy4d91mn74nQAxgXsq9wHAlCK2vOBiR0C+9sHgdFBsSQOA/HQ2Q/9/Xy/CHZXKaMquDAU
mKjMRcrOfJgweWObpkyKJ7y2sPeNMW1w+tszGw7NHTmP2BCIjvdpEV+8e3n+8YTO+JcPFz/f
Xh9/PcIfj6/fLi8v34drkJtbkwg+KQWecAzbzMWGK8Nk03efRXsb9dahN2cT8QXv2bjwoNDR
TyeGjB3s9TYL1FtCYDN9yH85yq2NN6sFJAmO70SiILE1ptU6QjKRg8MytS7sc4T90WNQQ2jn
mL9BU3L+Y+Zcg3wawbkjTmpaVy71gOscBT2gD8in6BCE1ccmNoUfMVdLEgd+7M29iDS1xt9b
LF4SXJekWkoLUC8z/AI0EYyCFNmh2T9XDJoop08QCgN48CnF6QooHgDBgbLukLi5DmrKFBBY
aA5KiPWcRDAYtNgIByt4H0nkjsnNmR9ATEVfh2p6sCQdzfFIaVttGgrPYrACMXAJ2++1MT06
VVQ8ddL+nv0CrbJN8RC8zUz+v3lhx6aLhrK24ovSQpJYDQ0rPcvQ9TFrKx3HadwrsacU4Hiq
+wrNLZ3sh8E7kiSJvMdSoGCYO60jxCS1K2oEvbMPorCwrXHTM5A/hZIHinHzUAoRn4qHmnze
ix6BI/yA98CvHldYB19bxETzmrJhXhjt5zFcZlpoylK/NerPmWNlRxZRsWOJL47XgMfbpsHQ
16ovSx8PIESt0rUtRDMcEqePK1YnWOXpana52CXRRbPaNVnbVft4uh3A6eSC9NxsDmc/zBuw
9RU+oRjcHwpgJrpb7ssEhJA1DSZxxlBoqqmaeCdkWN4OTek0TUWSlOT059sNOXS9RDvutIAO
c2Mn1GNTdq/K8mVsuZgWdvx8yLkFZ798YY7lkTC3YddAnwHvaSPte8LD3Grp4GLMgOISVetc
dN6Dix5hf1dPeAFj8xBSgw6WoQFZG/0aFIYs5c26NOO+Kurr288fyTyPuqM6fneNH/vCIeD9
GZ1QZpckIqnzzUh2DpgIzBJeJ1427zJ83VPNbpGRVwdW8mZdBsZ8/F+pMOnUQ05qKdpv0N6X
bYN0JwRVqnOt2aGh6eqUk7K28bb+TTAOvLEYfm+UpNqDJefPSZ7x+Xu+++TCO0j38x9FN9lx
ay8wBMvHLx/LfK1fcAmw8N3Mc5mr3kcYQdtTfG6YUWYGRDqGl3Cr3A/5VoYeWG1sm6+2g++s
pmmfdmFMDXyACo35dLNkvDrfXc2KpITBDF3rsIH+vr/RoXhO398Gk8hQ7E6lpIdhtBtVE9x2
/Fupmog8chbaYIj+M59WVCVvB5oFEvHTbaZJyUEbJBEtKRC7WvXDzV5sWA/WoC0t2O40GjDU
CnXCpHtwaE6cRja2mcuIIXZX/QHPRmuAb/YBAA==

--8t9RHnE3ZwKMSgU+--
