Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43F63AC667
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbhFRIrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 04:47:02 -0400
Received: from gofer.mess.org ([88.97.38.141]:43471 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233252AbhFRIrB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 04:47:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 65472C63DD; Fri, 18 Jun 2021 09:44:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624005890; bh=pCColrBIeLNWcny4pt5AXF7UHcVlzbrGZEnccEJYy60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AIizisB13sggT4jG8kbYArBahtXUYLhHeREah5DiZeG85250ebKnM/uExUoLRgdhD
         znnMu/09ZUHkun2/jvUoVB0NkR7MkXt5/nc482BIB2pw3JXM10KCRWuC4KjyoogHf6
         s6eTTc3K0Y0pahVwWXDhDmQ1gvqwv6i6vyOqSyDHAnSPuVyeNZRXP45XkH2jl35mYm
         6ZMsHayFwXsO4PQcwLzd8Nk1mLaySmYmun1ItGZFklA9D0nGUlD8gcXil/PE1Hgsr2
         2XxNnfxz9/gCVCJjJa1BA+8RWLq0qesAB63g1YXKBhxF/qJNEjwh6lc4ON97vn3ewo
         os+WgxuugtE8A==
Date:   Fri, 18 Jun 2021 09:44:50 +0100
From:   Sean Young <sean@mess.org>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v4 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <20210618084450.GA26388@gofer.mess.org>
References: <8e380fbe6853bfebd067cdeba2e65e83a3df2922.1623318855.git.sean@mess.org>
 <202106180629.J4nRNiax-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106180629.J4nRNiax-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 06:18:06AM +0800, kernel test robot wrote:
> Hi Sean,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linuxtv-media/master]
> [also build test WARNING on usb-serial/usb-next usb/usb-testing peter.chen-usb/for-usb-next v5.13-rc6 next-20210617]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sean-Young/IR-driver-for-USB-UIRT-device/20210616-182135
> base:   git://linuxtv.org/media_tree.git master
> config: powerpc64-randconfig-r012-20210617 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 64720f57bea6a6bf033feef4a5751ab9c0c3b401)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/17d3a0332baecb0359e05e8ae755478c7a1a4468
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sean-Young/IR-driver-for-USB-UIRT-device/20210616-182135
>         git checkout 17d3a0332baecb0359e05e8ae755478c7a1a4468
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/media/rc/uirt.c:11:
>    In file included from include/linux/completion.h:12:
>    In file included from include/linux/swait.h:5:
>    In file included from include/linux/list.h:9:
>    In file included from include/linux/kernel.h:12:
>    In file included from include/linux/bitops.h:32:
>    In file included from arch/powerpc/include/asm/bitops.h:62:
>    arch/powerpc/include/asm/barrier.h:49:9: warning: '__lwsync' macro redefined [-Wmacro-redefined]
>    #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
>            ^
>    <built-in>:310:9: note: previous definition is here
>    #define __lwsync __builtin_ppc_lwsync
>            ^
> >> drivers/media/rc/uirt.c:639:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!urb)
>                ^~~~
>    drivers/media/rc/uirt.c:705:9: note: uninitialized use occurs here
>            return err;

This is interesting. clang is right here, there are error paths where err is
not initialized. gcc-11.1 does not pick this up for some reason. The error path
should be an immediate dominator so it shouldn't be complicated to detect.

I'll send out a v5 with this issue fixed.

Sean

>                   ^~~
>    drivers/media/rc/uirt.c:639:2: note: remove the 'if' if its condition is always false
>            if (!urb)
>            ^~~~~~~~~
>    drivers/media/rc/uirt.c:630:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!urb)
>                ^~~~
>    drivers/media/rc/uirt.c:705:9: note: uninitialized use occurs here
>            return err;
>                   ^~~
>    drivers/media/rc/uirt.c:630:2: note: remove the 'if' if its condition is always false
>            if (!urb)
>            ^~~~~~~~~
>    drivers/media/rc/uirt.c:626:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!rc)
>                ^~~
>    drivers/media/rc/uirt.c:705:9: note: uninitialized use occurs here
>            return err;
>                   ^~~
>    drivers/media/rc/uirt.c:626:2: note: remove the 'if' if its condition is always false
>            if (!rc)
>            ^~~~~~~~
>    drivers/media/rc/uirt.c:622:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!uirt->out)
>                ^~~~~~~~~~
>    drivers/media/rc/uirt.c:705:9: note: uninitialized use occurs here
>            return err;
>                   ^~~
>    drivers/media/rc/uirt.c:622:2: note: remove the 'if' if its condition is always false
>            if (!uirt->out)
>            ^~~~~~~~~~~~~~~
>    drivers/media/rc/uirt.c:618:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!uirt->in)
>                ^~~~~~~~~
>    drivers/media/rc/uirt.c:705:9: note: uninitialized use occurs here
>            return err;
>                   ^~~
>    drivers/media/rc/uirt.c:618:2: note: remove the 'if' if its condition is always false
>            if (!uirt->in)
>            ^~~~~~~~~~~~~~
>    drivers/media/rc/uirt.c:604:15: note: initialize the variable 'err' to silence this warning
>            int pipe, err;
>                         ^
>                          = 0
>    6 warnings generated.
> 
> 
> vim +639 drivers/media/rc/uirt.c
> 
>    594	
>    595	static int uirt_probe(struct usb_interface *intf,
>    596			      const struct usb_device_id *id)
>    597	{
>    598		struct usb_device *usbdev = interface_to_usbdev(intf);
>    599		struct usb_endpoint_descriptor *ep_in;
>    600		struct usb_endpoint_descriptor *ep_out;
>    601		struct uirt *uirt;
>    602		struct rc_dev *rc;
>    603		struct urb *urb;
>    604		int pipe, err;
>    605	
>    606		if (usb_find_common_endpoints(intf->cur_altsetting, &ep_in, &ep_out, NULL, NULL) ||
>    607		    usb_endpoint_maxp(ep_in) != MAX_PACKET ||
>    608		    usb_endpoint_maxp(ep_out) != MAX_PACKET) {
>    609			dev_err(&intf->dev, "required endpoints not found\n");
>    610			return -ENODEV;
>    611		}
>    612	
>    613		uirt = kzalloc(sizeof(*uirt), GFP_KERNEL);
>    614		if (!uirt)
>    615			return -ENOMEM;
>    616	
>    617		uirt->in = kmalloc(MAX_PACKET, GFP_KERNEL);
>    618		if (!uirt->in)
>    619			goto free_uirt;
>    620	
>    621		uirt->out = kmalloc(MAX_PACKET, GFP_KERNEL);
>    622		if (!uirt->out)
>    623			goto free_uirt;
>    624	
>    625		rc = rc_allocate_device(RC_DRIVER_IR_RAW);
>    626		if (!rc)
>    627			goto free_uirt;
>    628	
>    629		urb = usb_alloc_urb(0, GFP_KERNEL);
>    630		if (!urb)
>    631			goto free_rcdev;
>    632	
>    633		pipe = usb_rcvbulkpipe(usbdev, ep_in->bEndpointAddress);
>    634		usb_fill_bulk_urb(urb, usbdev, pipe, uirt->in, MAX_PACKET,
>    635				  uirt_in_callback, uirt);
>    636		uirt->urb_in = urb;
>    637	
>    638		urb = usb_alloc_urb(0, GFP_KERNEL);
>  > 639		if (!urb)
>    640			goto free_rcdev;
>    641	
>    642		pipe = usb_sndbulkpipe(usbdev, ep_out->bEndpointAddress);
>    643		usb_fill_bulk_urb(urb, usbdev, pipe, uirt->out, MAX_PACKET,
>    644				  uirt_out_callback, uirt);
>    645	
>    646		uirt->dev = &intf->dev;
>    647		uirt->usbdev = usbdev;
>    648		uirt->rc = rc;
>    649		uirt->urb_out = urb;
>    650		uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
>    651	
>    652		err = usb_submit_urb(uirt->urb_in, GFP_KERNEL);
>    653		if (err != 0) {
>    654			dev_err(uirt->dev, "failed to submit read urb: %d\n", err);
>    655			goto free_rcdev;
>    656		}
>    657	
>    658		err = init_ftdi(usbdev);
>    659		if (err) {
>    660			dev_err(uirt->dev, "failed to setup ftdi: %d\n", err);
>    661			goto kill_urbs;
>    662		}
>    663	
>    664		err = uirt_setup(uirt);
>    665		if (err)
>    666			goto kill_urbs;
>    667	
>    668		usb_make_path(usbdev, uirt->phys, sizeof(uirt->phys));
>    669	
>    670		rc->device_name = "USB-UIRT";
>    671		rc->driver_name = KBUILD_MODNAME;
>    672		rc->input_phys = uirt->phys;
>    673		usb_to_input_id(usbdev, &rc->input_id);
>    674		rc->dev.parent = &intf->dev;
>    675		rc->priv = uirt;
>    676		rc->tx_ir = uirt_tx;
>    677		rc->s_tx_carrier = uirt_set_tx_carrier;
>    678		rc->s_learning_mode = uirt_set_rx_wideband;
>    679		rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>    680		rc->map_name = RC_MAP_RC6_MCE;
>    681		rc->rx_resolution = UNIT_US;
>    682		rc->timeout = IR_TIMEOUT;
>    683	
>    684		uirt_set_tx_carrier(rc, 38000);
>    685	
>    686		err = rc_register_device(rc);
>    687		if (err)
>    688			goto kill_urbs;
>    689	
>    690		usb_set_intfdata(intf, uirt);
>    691	
>    692		return 0;
>    693	
>    694	kill_urbs:
>    695		usb_kill_urb(uirt->urb_in);
>    696		usb_kill_urb(uirt->urb_out);
>    697	free_rcdev:
>    698		usb_free_urb(uirt->urb_in);
>    699		usb_free_urb(uirt->urb_out);
>    700		rc_free_device(rc);
>    701	free_uirt:
>    702		kfree(uirt->in);
>    703		kfree(uirt->out);
>    704		kfree(uirt);
>    705		return err;
>    706	}
>    707	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


